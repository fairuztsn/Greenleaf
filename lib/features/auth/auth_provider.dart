import 'package:flutter/foundation.dart';
import 'package:greenleaf/config/providers.dart';
import 'package:greenleaf/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:greenleaf/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  final authClient = supabaseClient.auth;
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;
  return AuthRepository(
    AuthTokenLocalDataSource(
      prefs,
    ),
    authClient,
    supabaseClient,
  );
}

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);
