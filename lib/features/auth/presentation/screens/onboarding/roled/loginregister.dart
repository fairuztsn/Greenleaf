// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:greenleaf/shared/base.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({
    required this.rolename,
    required this.description,
    required this.login,
    required this.register,
    super.key,
  });
  final String rolename;
  final String description;
  final VoidCallback login;
  final VoidCallback register;

  static const String route = 'loginregisterrouter';

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
      register: widget.register,
    );
  }
}
