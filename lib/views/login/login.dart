import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/controller/auth_controller.dart';
import 'package:greenleaf/provider/common/user_profile.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';
import 'package:greenleaf/utils/snackbar.dart';
import 'package:greenleaf/views/login/help/help.dart';
import 'package:greenleaf/views/navbar/navbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String rolename;
  const LoginScreen({
    super.key,
    required this.rolename,
  });

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
          toLinkable: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const LoginHelpScreen(),
                    type: PageTransitionType.leftToRight));
          },
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
                await ref
                    .read(authControllerProvider.notifier)
                    .emailPassUserSignIn(
                        email: email.text, password: password.text);
                if (mounted) {
                  navigator.popUntil((route) => route.isFirst);
                  navigator.pushReplacement(PageTransition(
                      child: const Navbar(), type: PageTransitionType.fade));
                }
              } on AuthException catch (e) {
                if (mounted && e.message.contains("Invalid")) {
                  navigator.pop();
                  Snackbars.showFailedSnackbar(context,
                      title: "Login Failed",
                      message: "Email atau Password Salah!");
                }
              } on PostgrestException catch (e) {
                if (mounted && e.message.contains("rows")) {
                  navigator.pop();
                  Snackbars.showFailedSnackbar(context,
                      title: "Error occured", message: "Data tidak ditemukan");
                }
              } catch (e) {
                if (mounted) {
                  navigator.pop();
                  Snackbars.showFailedSnackbar(context,
                      title: "Unknown Error occured", message: e.toString());
                  print(e);
                }
              } finally {
                ref.read(userProfileProvider);
              }
            }
            setState(() {});
          },
          submit: "Masuk",
          formKey: formKey),
    );
  }
}
