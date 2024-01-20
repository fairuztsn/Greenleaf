// ignore_for_file: public_member_api_docs, inference_failure_on_untyped_parameter

import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_email_password_controller.g.dart';

@riverpod
class SignInWithEmailPasswordController
    extends _$SignInWithEmailPasswordController {
  @override
  FutureOr<bool> build() async {
    print('hes here for me');
    return false;
  }

  FutureVoid signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      print('what happen');
      await ref
          .read(authRepositoryProvider)
          .signInWithEmailPass(email: email, password: password);
      state = const AsyncData(true);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
