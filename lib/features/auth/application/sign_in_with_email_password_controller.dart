// ignore_for_file: public_member_api_docs, inference_failure_on_untyped_parameter

import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_with_email_password_controller.g.dart';

@riverpod
class SignInWithEmailPasswordController
    extends _$SignInWithEmailPasswordController {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  FutureVoid signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // try {
    final res = await ref
        .read(authRepositoryProvider)
        .signInWithEmailPass(email: email, password: password);
    print('power');
    res.fold((l) => state = AsyncError(l, StackTrace.current), (r) {
      if (r) {
        state = AsyncData(r);
      }
    });
    // } catch (e) {
    //   state = AsyncError(e.toString(), StackTrace.current);
    // }
  }
}
