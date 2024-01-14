import 'package:flutter/material.dart';
import 'package:greenleaf/shared/base.dart';

class LoginRegister extends StatefulWidget {
  final String rolename;
  final String description;
  final VoidCallback login;
  final VoidCallback register;
  const LoginRegister(
      {super.key,
      required this.rolename,
      required this.description,
      required this.login,
      required this.register});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.generalAuthBackground(
        context: context,
        roleName: widget.rolename,
        description: widget.description,
        login: widget.login,
        register: widget.register);
  }
}
