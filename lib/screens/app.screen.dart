import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/containers/home.container.dart';

class AppScreen extends StatelessWidget {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW2P<String, double, ThemeData> appOnGenerateThemeData;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleCode;

  AppScreen({
    Key key,
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleCode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      onGenerateTitle: appOnGenerateTitle,
      onGenerateRoute: (RouteSettings settings) => PageTransition(
        curve: Curves.easeInOutQuart,
        type: PageTransitionType.rightToLeft,
        child: HomeContainer()
      ),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      locale: Locale(
        this.settingsLocaleCode.split('-')[0],
        this.settingsLocaleCode.split('-')[1]
      ),
      builder: (BuildContext context, Widget navigator) {
        return Theme(
          child: navigator,
          data: appOnGenerateThemeData(
            context,
            this.settingsThemeQuraniFontFamily,
            this.settingsThemeFontSize
          )
        );
      }
    );
  }
}
