import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/auth_controller.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:greenleaf/views/navbar/navbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

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
          states: "Masuk",
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
          linkable: "Lupa password atau email?",
          toLinkable: () {},
          lanjut: () async {
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
              try {
                // await ref.read(authControllerProvider.notifier).emailPassSignIn(
                //     email: email.text, password: password.text);
                if (!mounted) return;
                Snackbars.showSuccessSnackbar(context,
                    title: "Login Success", message: "Welcome to GreenLeaf");
                navigator.popUntil((route) => route.isFirst);
                navigator.pushReplacement(PageTransition(
                    child: const Navbar(), type: PageTransitionType.fade));
              } on PostgrestException catch (e) {
                navigator.pop();
                Snackbars.showFailedSnackbar(context,
                    title: "Login Failed", message: e.toString());
              }
            }
            setState(() {});
          },
          formKey: formKey),
    );
  }
}
