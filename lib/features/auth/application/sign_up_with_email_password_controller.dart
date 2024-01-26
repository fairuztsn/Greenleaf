import 'package:greenleaf/core/core.dart';
import 'package:greenleaf/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_with_email_password_controller.g.dart';

@riverpod

///
class SignUpWithEmailPasswordController
    extends _$SignUpWithEmailPasswordController {
  @override
  Future<AuthResponse> build() async {
    return AuthResponse();
  }

  ///
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
      if (r.session == null && r.user == null) {
        state = AsyncError('No Data', StackTrace.current);
      } else {
        state = AsyncData(r);
      }
    });
  }
}
