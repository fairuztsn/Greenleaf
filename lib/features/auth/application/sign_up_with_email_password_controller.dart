// ignore_for_file: public_member_api_docs

import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_with_email_password_controller.g.dart';

@riverpod
class SignUpWithEmailPasswordController
    extends _$SignUpWithEmailPasswordController {
  @override
  Future<bool> build() async {
    return false;
  }

  FutureVoid signUpWithEmailPassword({
    required String email,
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
    required int role,
  }) async {
    final res = await ref
        .read(authRepositoryProvider)
        .signUpWithEmailPass(email, password, phone, firstName, lastName, role);
    res.fold((l) {
      state = AsyncError(l.toString(), StackTrace.current);
    }, (r) {
      state = const AsyncData(true);
    });
  }
}
