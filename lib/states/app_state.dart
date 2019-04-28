import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran/delegates/generators.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/containers/home_container.dart';
import 'package:quran/containers/chapter_details_container.dart';
import 'package:quran/containers/help_and_support_container.dart';
import 'package:quran/containers/settings_container.dart';
import 'package:quran/containers/about_container.dart';

class AppState {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW2P<String, double, ThemeData> appOnGenerateThemeData;
  final String appInitialRoute;
  final GeneratorWNP<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  
  AppState({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  });

  factory AppState.initial() {
    return AppState(
      appOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('app-title'),
      appOnGenerateThemeData: (
        BuildContext context,
        String quraniFontFamily,
        double fontSize
      ) {
        final theme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          accentColor: Colors.tealAccent,
          fontFamily: 'IranSans'
        );

        final defaultFont = TextStyle(
          fontFamily: 'IranSans',
          fontSize: fontSize,
          fontWeight: FontWeight.w400
        );

        final quraniFont = TextStyle(
          fontFamily: quraniFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w400
        );

        return theme.copyWith(
          textTheme: TextTheme(
            headline: quraniFont.copyWith(
              color: theme.cardColor,
              fontSize: 20,
              height: 1.1
            ),
            overline: quraniFont.apply(
              color: theme.cardColor
            ),
            title: quraniFont.apply(
              color: theme.primaryColor,
              fontSizeFactor: 1.25
            ),
            display1: defaultFont.apply(
              color: theme.disabledColor,
              fontSizeFactor: 0.8
            ),
            display2: defaultFont.copyWith(
              color: theme.cardColor,
              fontSize: 16.0
            ),
            display3: defaultFont.copyWith(
              color: Colors.black87,
              fontSize: 15.0
            ),
            display4: defaultFont.apply(
              color: theme.primaryColorDark,
              fontSizeFactor: 1.25
            )
          )
        );
      },
      appInitialRoute: HomeContainer.routeName,
      appOnGenerateRoutes: (BuildContext context) => <String, WidgetBuilder>{
        HomeContainer.routeName: (BuildContext context) => HomeContainer(),
        ChapterDetailsContainer.routeName: (BuildContext context) => ChapterDetailsContainer(),
        HelpAndSupportContainer.routeName: (BuildContext context) => HelpAndSupportContainer(),
        SettingsContainer.routeName: (BuildContext context) => SettingsContainer(),
        AboutContainer.routeName: (BuildContext context) => AboutContainer()
      },
      appLocalizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      appSupportedLocales: [
        Locale('fa', 'IR'),
      ]
    );
  }
}