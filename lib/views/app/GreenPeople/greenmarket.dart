import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/shared/base.dart';

class GreenMarketScreen extends ConsumerStatefulWidget {
  const GreenMarketScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GreenMarketScreenState();
}

class _GreenMarketScreenState extends ConsumerState<GreenMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.standardBackground(
        body: Center(
      child: Text(
        "Ini GreenMarket Page",
        style: TextStyle(fontSize: 8),
      ),
    ));
  }
}
