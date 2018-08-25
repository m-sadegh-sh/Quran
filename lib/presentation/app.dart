import 'package:flutter/material.dart';

import 'package:Quran/delegates/generate_app_routes.dart';

class App extends StatelessWidget {
  final String appTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final GenerateAppRoutes appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;

  App({
    Key key,
    this.appTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: appTitle,
      theme: appTheme,
      initialRoute: appInitialRoute,
      routes: appOnGenerateRoutes(context),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales
    );
  }
}
