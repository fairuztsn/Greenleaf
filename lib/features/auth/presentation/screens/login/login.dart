// ignore_for_file: public_member_api_docs, inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/auth/application/sign_in_with_email_password_controller.dart';
import 'package:greenleaf/features/auth/presentation/screens/login/help/help.dart';
import 'package:greenleaf/features/common/presentation/screens/navbar/navbar.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    required this.rolename,
    super.key,
  });
  final String rolename;

  static const String route = 'login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordObscured = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.loginRegisterBackground(
        states: 'Masuk',
        children: [
          TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Fill The Email Correctly!';
              }
              return null;
            },
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.colorGreenLeaf,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              label: const Text(
                'Email',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Fill The Password';
              }
              return null;
            },
            controller: password,
            obscureText: isPasswordObscured,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.colorGreenLeaf,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              label: const Text(
                'Password',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (isPasswordObscured) {
                      isPasswordObscured = false;
                    } else {
                      isPasswordObscured = true;
                    }
                  });
                },
                icon: Icon(
                  isPasswordObscured == true
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: AppColors.colorGreenLeaf,
                ),
              ),
            ),
          ),
        ],
        linkable: 'Lupa password atau email?',
        toLinkable: () {
          Navigator.push(
            context,
            PageTransition(
              child: const LoginHelpScreen(),
              type: PageTransitionType.leftToRight,
            ),
          );
        },
        lanjut: () async {
          final navigator = Navigator.of(context);
          if (formKey.currentState!.validate()) {
            unawaited(showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.colorGreenLeaf,
                ),
              ),
            ));
            try {
              await ref
                  .read(signInWithEmailPasswordControllerProvider.notifier)
                  .signInWithEmailPassword(
                    email: email.text,
                    password: password.text,
                  );
              if (mounted) {
                navigator.popUntil((route) => route.isFirst);
                await navigator.pushReplacement(
                  PageTransition(
                    child: const Navbar(),
                    type: PageTransitionType.fade,
                  ),
                );
              }
            } on AuthException catch (e) {
              if (mounted && e.message.contains('Invalid')) {
                navigator.pop();
                Snackbars.showFailedSnackbar(
                  context,
                  title: 'Login Failed',
                  message: 'Email atau Password Salah!',
                );
              }
            } on PostgrestException catch (e) {
              if (mounted && e.message.contains('rows')) {
                navigator.pop();
                Snackbars.showFailedSnackbar(
                  context,
                  title: 'Error occured',
                  message: 'Data tidak ditemukan',
                );
              }
            } catch (e, stcktrc) {
              if (mounted) {
                navigator.pop();
                Snackbars.showFailedSnackbar(
                  context,
                  title: 'Unknown Error occured',
                  message: stcktrc.toString(),
                );
                print(e);
                print(stcktrc);
              }
            }
          }
          setState(() {});
        },
        submit: 'Masuk',
        formKey: formKey,
      ),
    );
  }
}
