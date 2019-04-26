import 'package:flutter/material.dart';
import 'package:quran/delegates/generators.dart';

class App extends StatelessWidget {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW2P<String, double, ThemeData> appOnGenerateThemeData;
  final String appInitialRoute;
  final Map<String, WidgetBuilder> appRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeQuraniFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;

  App({
    Key key,
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appInitialRoute,
    this.appRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeQuraniFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode
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
      locale: Locale(
        this.settingsLocaleLanguageCode,
        this.settingsLocaleCountryCode
      ),
      builder: (BuildContext context, Widget navigator) {
        return Theme(
          child: navigator,
          data: appOnGenerateThemeData(
            context,
            this.settingsThemeQuraniFontFamily,
            this.settingsThemeQuraniFontSize
          )
        );
      }
    );
  }
}
