import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'SUPABASE_URL')
  static const String supabaseUrl = _Env.supabaseUrl;
  @EnviedField(varName: 'SUPABASE_DB_PASSWORD')
  static const String supabaseDbPassword = _Env.supabaseDbPassword;
  @EnviedField(varName: 'SUPABASE_PUBLIC_KEY')
  static const String supabasePublicKey = _Env.supabasePublicKey;
  @EnviedField(varName: 'SUPABASE_STORAGE_RETRY_ATTEMPTS')
  static const int supabaseStorageRetryAttempts = _Env.supabaseStorageRetryAttempts;
}