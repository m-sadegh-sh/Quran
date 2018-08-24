import 'package:flutter/material.dart';

import 'package:Quran/delegates/create_routes_delegate.dart';

class App extends StatelessWidget {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final CreateRoutes appOnCreateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;

  App({
    Key key,
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnCreateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      onGenerateTitle: appOnGenerateTitle,
      theme: appTheme,
      initialRoute: appInitialRoute,
      routes: appOnCreateRoutes(context),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales
    );
  }
}
