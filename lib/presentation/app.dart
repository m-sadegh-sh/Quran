import 'package:flutter/material.dart';
import 'package:quran/delegates/generators.dart';

class App extends StatelessWidget {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorWNP<ThemeData> appOnGenerateThemeData;
  final String appInitialRoute;
  final Map<String, WidgetBuilder> appRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appLocale;

  App({
    Key key,
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appInitialRoute,
    this.appRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.appLocale
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      onGenerateTitle: appOnGenerateTitle,
      initialRoute: appInitialRoute,
      routes: appRoutes,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      locale: appLocale,
      builder: (BuildContext context, Widget navigator) {
        return Theme(
          child: navigator,
          data: appOnGenerateThemeData(context)
        );
      }
    );
  }
}
