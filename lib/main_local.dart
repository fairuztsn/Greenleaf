import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/app.dart';
import 'package:greenleaf/bootstrap.dart';
import 'package:greenleaf/flavors.dart';

void main() async {
  F.appFlavor = Flavor.local;
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const GreenLeafApp(),
    ),
  );
}
