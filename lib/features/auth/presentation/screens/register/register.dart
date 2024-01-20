// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/config/app_colors.dart';
import 'package:greenleaf/features/auth/presentation/screens/register/help/help.dart';
import 'package:greenleaf/features/auth/presentation/screens/register/second_step/second_register.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({required this.rolename, super.key});

  final String rolename;

  static const String route = 'register';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  bool isPasswordObscured = true;
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
                borderSide: const BorderSide(color: AppColors.colorGreenLeaf),
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
                return 'Please Fill The Phone Number Correctly!';
              }
              return null;
            },
            controller: phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.colorGreenLeaf),
                borderRadius: BorderRadius.circular(10),
              ),
              label: const Text(
                'Phone',
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
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.colorGreenLeaf),
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
            Future.delayed(const Duration(milliseconds: 1500), () {
              navigator.pushReplacement(
                PageTransition(
                  child: SecondRegisterScreen(
                    email: email.text,
                    phone: phone.text,
                    password: password.text,
                  ),
                  type: PageTransitionType.rightToLeft,
                ),
              );
              // context.goNamed(
              //   SecondRegisterScreen.route,
              //   extra: {
              //     'email': email.text,
              //     'password': password.text,
              //     'phone': phone.text
              //   },
              // );
            });
          }
          setState(() {});
        },
        submit: 'Lanjut',
        formKey: formKey,
      ),
    );
  }
}
