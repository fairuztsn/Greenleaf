import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/config/app_colors.dart';

class LoginHelpScreen extends ConsumerStatefulWidget {
  const LoginHelpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginHelpScreenState();
}

class _LoginHelpScreenState extends ConsumerState<LoginHelpScreen> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.loginRegisterBackground(
          states: "Lupa Password?",
          children: [
            const Text(
              "Masukkan email Anda untuk mendapatkan konfirmasi ubah password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
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
                          width: 1, color: AppColors.colorGreenLeaf),
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text(
                    "Email",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          linkable: "",
          toLinkable: () {},
          lanjut: () {},
          submit: "Submit",
          formKey: formKey),
    );
  }
}
