import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.loginRegisterBackground(
        states: "Daftar",
        children: [Text("Ini Register Page")],
        linkable: "Ada kendala?",
        toLinkable: () {},
        lanjut: () {});
  }
}
