// ignore_for_file: public_member_api_docs

import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///
abstract class AuthRepositoryInterface {
  /// Sign in with Google
  FutureEither<bool> signInWithGoogle();

  FutureEither<AuthResponse> signInWithEmailPass(
    String email,
    String password,
  );

  FutureEither<AuthResponse> signUpWithEmailPass(
    String email,
    String password,
    String phone,
    String firstName,
    String lastName,
    int role,
  );

  /// Sign out
  FutureEither<bool> signOut();

  /// Listen to auth changes
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  );

  /// Store token
  FutureVoid setSession(String token);

  /// restore session from token
  FutureEither<UserEntity> restoreSession();
}
