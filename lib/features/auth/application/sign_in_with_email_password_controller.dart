import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_with_email_password_controller.g.dart';

@riverpod

///
class SignInWithEmailPasswordController
    extends _$SignInWithEmailPasswordController {
  @override
  FutureOr<AuthResponse> build() async {
    return AuthResponse();
  }

  ///
  FutureVoid signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // try {
    final res = await ref
        .read(authRepositoryProvider)
        .signInWithEmailPass(email: email, password: password);
    res.fold((l) => state = AsyncError(l, StackTrace.current), (r) {
      if (r.session == null && r.user == null) {
        state = AsyncError('No Data', StackTrace.current);
      } else {
        state = AsyncData(r);
      }
    });
  }
}
