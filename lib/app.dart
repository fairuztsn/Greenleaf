import 'package:flutter/material.dart';
import 'package:greenleaf/config/routes.dart';
import 'package:greenleaf/config/theme.dart';
import 'package:greenleaf/l10n/app_localizations.dart';
import 'package:greenleaf/res/strings.dart';

///Root App Widget
class GreenLeafApp extends StatelessWidget {
  /// GreenLeafApp Constructor
  const GreenLeafApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
