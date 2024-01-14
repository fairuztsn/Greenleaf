import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.loginRegisterBackground(
        states: "Masuk",
        children: [Text("Ini Login Page")],
        linkable: "Lupa password atau email?",
        toLinkable: () {},
        lanjut: () {});
  }
}
