import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';

class GreenCarryScreen extends ConsumerStatefulWidget {
  const GreenCarryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GreenCarryScreenState();
}

class _GreenCarryScreenState extends ConsumerState<GreenCarryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
        body: Center(
      child: Text("Ini GreenCarry"),
    ));
  }
}
