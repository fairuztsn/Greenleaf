import 'package:flutter/foundation.dart';
import 'package:greenleaf/config/providers.dart';
import 'package:greenleaf/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:greenleaf/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
Future<AuthRepository> authRepository(AuthRepositoryRef ref) async {
  final supabaseClient = ref.watch(supabaseClientProvider);
  print(supabaseClient);
  final authClient = supabaseClient.auth;
  print(authClient);
  final pref = ref.read(sharedPreferencesProvider).value;
  print(pref);

  return AuthRepository(
    AuthTokenLocalDataSource(pref!),
    authClient,
    supabaseClient,
  );
}

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);
