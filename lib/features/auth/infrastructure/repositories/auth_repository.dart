// ignore_for_file: unnecessary_breaks, public_member_api_docs

import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:greenleaf/features/auth/domain/entities/user_entity.dart';
import 'package:greenleaf/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:greenleaf/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Repository that handles authorization and persists session
class AuthRepository implements AuthRepositoryInterface {
  /// Default constructor
  AuthRepository(
    this.authTokenLocalDataSource,
    this.authClient,
    this.postgrestClient,
  );

  /// local token storage provider
  final AuthTokenLocalDataSource authTokenLocalDataSource;

  /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes
  final supabase.GoTrueClient authClient;

  final supabase.SupabaseClient postgrestClient;

  /// Current authorized User
  UserEntity? get currentUser => authClient.currentUser == null
      ? null
      : UserEntity.fromJson(authClient.currentUser!.toJson());

  String? get hostname => Platform.localHostname;

  /// Returns Stream with auth user changes
  @override
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  ) {
    authClient.onAuthStateChange.listen((data) {
      switch (data.event) {
        case supabase.AuthChangeEvent.signedIn:
        case supabase.AuthChangeEvent.userUpdated:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          callback(
            UserEntity.fromJson(data.session!.user.toJson()),
          );
          break;
        case supabase.AuthChangeEvent.signedOut:
        case supabase.AuthChangeEvent.userDeleted:
          callback(null);
          break;
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
          break;
        case supabase.AuthChangeEvent.initialSession:
      }
    });
  }

  ///
  @override
  Future<Either<Failure, UserEntity>> setSession(String token) async {
    try {
      final response = await authClient.setSession(token);
      await authTokenLocalDataSource
          .store(response.session?.providerToken ?? '');

      final user = response.user;

      if (user == null) {
        await authTokenLocalDataSource.remove();
        return left(const Failure.unauthorized());
      }

      return right(UserEntity.fromJson(user.toJson()));
    } catch (_) {
      return left(const Failure.unauthorized());
    }
  }

  /// Recovers session from local storage and refreshes tokens
  @override
  Future<Either<Failure, UserEntity>> restoreSession() async {
    try {
      final res = authTokenLocalDataSource.get();
      if (res.isLeft()) {
        return left(const Failure.empty());
      }

      final response =
          await authClient.recoverSession(res.getOrElse((_) => ''));
      final user = response.user;

      if (user == null) {
        await authTokenLocalDataSource.remove();
        return left(const Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(response.session?.providerToken ?? '');

      return right(UserEntity.fromJson(user.toJson()));
    } catch (_) {
      return left(const Failure.unauthorized());
    }
  }

  /// Signs in user to the application
  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    log('here2');
    final res = await authClient.signInWithOAuth(
      supabase.OAuthProvider.google,
    );
    if (!res) {
      return left(const Failure.badRequest());
    }
    return right(true);
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> signInWithEmailPass(
    String email,
    String password,
  ) async {
    final res =
        await authClient.signInWithPassword(email: email, password: password);
    if (res.session == null || res.user == null) {
      return left(const Failure.badRequest());
    }
    final ipAddr = await InternetAddress.lookup(
      hostname.toString(),
      type: InternetAddressType.IPv4,
    );

    final checkTry = <String, dynamic>{
      'user_id': res.user!.id,
      'last_logged_in': DateTime.now().toIso8601String(),
      'host_name': hostname.toString(),
      'ip': ipAddr.first.address,
    };

    await postgrestClient.from('ad_login_history').insert(checkTry);
    return right(res);
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> signUpWithEmailPass(
    String email,
    String password,
    String phone,
    String firstName,
    String lastName,
    int role,
  ) async {
    final res = await authClient.signUp(
      email: email,
      phone: phone,
      password: password,
    );
    if (res.session == null || res.user == null) {
      return left(const Failure.badRequest());
    }
    final credUser = res.user?.id;
    final user = <String, dynamic>{
      'user_id': credUser,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phone,
      'role_id': role,
      'privilege_id': 'Peasant',
    };

    final temp =
        await postgrestClient.from('ad_profile_data').insert(user).select();
    if (temp.isEmpty) {
      return left(const Failure.empty());
    }

    final ipAddr = await InternetAddress.lookup(
      hostname.toString(),
      type: InternetAddressType.IPv4,
    );

    final checkTry = <String, dynamic>{
      'user_id': res.user!.id,
      'last_logged_in': DateTime.now().toIso8601String(),
      'host_name': hostname.toString(),
      'ip': ipAddr.first.address,
    };

    await postgrestClient.from('ad_login_history').insert(checkTry);

    return right(res);
  }

  /// Signs out user from the application
  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await authTokenLocalDataSource.remove();

      await authClient.signOut();
      return right(true);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }
}
