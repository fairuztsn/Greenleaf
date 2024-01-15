import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';
import 'package:greenleaf/shared/const.dart';

class RegisterHelpScreen extends ConsumerStatefulWidget {
  const RegisterHelpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterHelpScreenState();
}

class _RegisterHelpScreenState extends ConsumerState<RegisterHelpScreen> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseApp.loginRegisterBackground(
          states: "Ada Kendala?",
          children: [
            const Text(
              "Masukkan email Anda untuk mendapatkan bantuan dari tim kami",
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
          ],
          linkable: "",
          toLinkable: () {},
          lanjut: () {},
          submit: "Submit",
          formKey: formKey),
    );
  }
}
