import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/views/register/help/help.dart';
import 'package:greenleaf/views/register/second_step.dart/second_register.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

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
          states: "Daftar",
          children: [
            TextFormField(
              validator: ((val) {
                if (val!.isEmpty) {
                  return 'Please Fill The Email Correctly!';
                }
                return null;
              }),
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Constants.colorGreenLeaf),
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Email",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: ((val) {
                if (val!.isEmpty) {
                  return 'Please Fill The Phone Number Correctly!';
                }
                return null;
              }),
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Constants.colorGreenLeaf),
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Phone",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: ((val) {
                if (val!.isEmpty) {
                  return 'Please Fill The Password';
                }
                return null;
              }),
              controller: password,
              obscureText: isPasswordObscured,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Constants.colorGreenLeaf),
                    borderRadius: BorderRadius.circular(10)),
                label: const Text(
                  "Password",
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
                      color: Constants.colorGreenLeaf),
                ),
              ),
            ),
          ],
          linkable: "Ada kendala?",
          toLinkable: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const RegisterHelpScreen(),
                    type: PageTransitionType.leftToRight));
          },
          lanjut: () {
            final navigator = Navigator.of(context);
            if (formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Constants.colorGreenLeaf,
                        ),
                      ));
              Future.delayed(const Duration(milliseconds: 1500), () {
                navigator.pushReplacement(
                  PageTransition(
                      child: SecondRegisterScreen(
                        email: email.text,
                        phone: phone.text,
                        password: password.text,
                      ),
                      type: PageTransitionType.rightToLeft),
                );
              });
            }
            setState(() {});
          },
          submit: "Lanjut",
          formKey: formKey),
    );
  }
}
