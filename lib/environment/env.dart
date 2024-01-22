import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')

/// Environment Variables
final class Env {
  @EnviedField(varName: 'SUPABASE_URL')

  /// Supabase URL
  static const String supabaseUrl = _Env.supabaseUrl;
  @EnviedField(varName: 'SUPABASE_DB_PASSWORD')

  /// Supabase Database Password
  static const String supabaseDbPassword = _Env.supabaseDbPassword;
  @EnviedField(varName: 'SUPABASE_PUBLIC_KEY')

  /// Supabase Public/Anon Key
  static const String supabasePublicKey = _Env.supabasePublicKey;
  @EnviedField(varName: 'SUPABASE_STORAGE_RETRY_ATTEMPTS')

  /// Supabase Configured Storage Retry Attempts
  static const int supabaseStorageRetryAttempts =
      _Env.supabaseStorageRetryAttempts;
}
