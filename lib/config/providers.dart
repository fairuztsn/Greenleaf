import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/environment/env.dart';
import 'package:greenleaf/features/auth/application/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'providers.g.dart';

@riverpod

///Providers for Fetching Local Data Source
FutureOr<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}

@riverpod

///Provider for Initializing our Backend: Supabase
FutureOr<Supabase> supabase(SupabaseRef ref) async {
  return Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabasePublicKey,
    storageOptions: const StorageClientOptions(
        retryAttempts: Env.supabaseStorageRetryAttempts),
    realtimeClientOptions:
        const RealtimeClientOptions(logLevel: RealtimeLogLevel.info),
    debug: kDebugMode,
  );
}

@riverpod

///Providing SupabaseClient for Our Child Controller
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return ref.watch(supabaseProvider).valueOrNull!.client;
}

///Initializer for bootstrap.dart
Future<void> initializeProviders(ProviderContainer container) async {
  /// Core
  await container.read(sharedPreferencesProvider.future);
  await container.read(supabaseProvider.future);

  /// Auth
  container.read(authControllerProvider);
}
