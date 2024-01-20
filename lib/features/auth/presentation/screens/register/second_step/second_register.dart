// ignore_for_file: public_member_api_docs, inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/auth/application/sign_up_with_email_password_controller.dart';
import 'package:greenleaf/features/auth/presentation/screens/register/help/help.dart';
import 'package:greenleaf/features/common/presentation/screens/navbar/navbar.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SecondRegisterScreen extends ConsumerStatefulWidget {
  const SecondRegisterScreen({
    required this.email,
    required this.phone,
    required this.password,
    super.key,
  });
  final String email;
  final String phone;
  final String password;

  static const String route = 'secondregisteruser';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends ConsumerState<SecondRegisterScreen> {
  String get email => widget.email;
  String get phone => widget.phone;
  String get password => widget.password;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.loginRegisterBackground(
        states: 'Daftar',
        children: [
          TextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Fill The Name Correctly!';
              }
              return null;
            },
            controller: firstName,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.colorGreenLeaf,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              label: const Text(
                'First Name',
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
                return 'Please Fill The Name Correctly!';
              }
              return null;
            },
            controller: lastName,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.colorGreenLeaf),
                borderRadius: BorderRadius.circular(10),
              ),
              label: const Text(
                'Last Name',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        linkable: 'Ada kendala?',
        toLinkable: () {
          Navigator.push(
            context,
            PageTransition(
              child: const RegisterHelpScreen(),
              type: PageTransitionType.leftToRight,
            ),
          );
        },
        lanjut: () {
          final navigator = Navigator.of(context);
          if (formKey.currentState!.validate()) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.colorGreenLeaf,
                ),
              ),
            );
            Future.delayed(const Duration(milliseconds: 1500), () async {
              try {
                await ref
                    .read(signUpWithEmailPasswordControllerProvider.notifier)
                    .signUpWithEmailPassword(
                      email: email,
                      password: password,
                      phone: phone,
                      firstName: firstName.text,
                      lastName: lastName.text,
                      role: 1,
                    );
                if (mounted) {
                  Snackbars.showSuccessSnackbar(
                    context,
                    title: 'Register Success',
                    message: 'Welcome to GreenLeaf',
                  );
                  navigator.popUntil((route) => route.isFirst);
                  await navigator.pushReplacement(
                    PageTransition(
                      child: const Navbar(),
                      type: PageTransitionType.fade,
                    ),
                  );
                }
              } on AuthException catch (e) {
                if (mounted) {
                  navigator.pop();
                  Snackbars.showFailedSnackbar(
                    context,
                    title: 'Register Failed',
                    message: e.toString(),
                  );
                }
              } catch (e) {
                if (mounted) {
                  navigator.pop();
                  Snackbars.showFailedSnackbar(
                    context,
                    title: 'Unknown error occured',
                    message: e.toString(),
                  );
                }
              }
            });
          }
          setState(() {});
        },
        submit: 'Daftar',
        formKey: formKey,
      ),
    );
  }
}
