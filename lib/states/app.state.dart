import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/app_localizations.dart';

class AppState {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW3P<String, double, String, ThemeData> appOnGenerateThemeData;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  
  AppState({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  });

  factory AppState.initial() {
    return AppState(
      appOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('app-title'),
      appOnGenerateThemeData: (
        BuildContext context,
        String settingsThemeQuraniFontFamily,
        double settingsThemeFontSize,
        String settingsLocaleCode
      ) {
        final nonQuraniFontFamily = settingsLocaleCode == 'fa-IR' ? 'IranSans' : 'Roboto';

        final theme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          accentColor: Colors.tealAccent,
          fontFamily: nonQuraniFontFamily
        );

        final defaultFont = TextStyle(
          fontFamily: nonQuraniFontFamily,
          fontSize: settingsThemeFontSize,
          fontWeight: FontWeight.w400
        );

        final quraniFont = TextStyle(
          fontFamily: settingsThemeQuraniFontFamily,
          fontSize: settingsThemeFontSize,
          fontWeight: FontWeight.w400
        );

        return theme.copyWith(
          selectedRowColor: theme.primaryColor,
          highlightColor: theme.primaryColorLight,
          bottomAppBarTheme: BottomAppBarTheme(
            color: theme.primaryColor,
          ),
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
              color: theme.unselectedWidgetColor,
              fontSize: 15.0
            ),
            display4: defaultFont.apply(
              color: theme.primaryColorDark,
              fontSizeFactor: 1.25
            )
          )
        );
      },
      appLocalizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      appSupportedLocales: [
        Locale('fa', 'IR'),
        Locale('en', 'US')
      ]
    );
  }
}