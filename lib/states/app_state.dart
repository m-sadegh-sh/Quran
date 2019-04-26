import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran/delegates/generators.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/containers/home_container.dart';
import 'package:quran/containers/chapter_details_container.dart';
import 'package:quran/containers/search_container.dart';
import 'package:quran/containers/share_container.dart';
import 'package:quran/containers/bookmark_container.dart';
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
        double quraniFontSize
      ) {
        final theme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          accentColor: Colors.tealAccent,
          fontFamily: 'IranSans'
        );

        final defaultFont = TextStyle(
          fontFamily: 'IranSans',
          fontSize: 16,
          fontWeight: FontWeight.w400
        );

        final quraniFont = TextStyle(
          fontFamily: quraniFontFamily,
          fontSize: quraniFontSize,
          fontWeight: FontWeight.w400
        );

        return theme.copyWith(
          textTheme: TextTheme(
            headline: quraniFont.copyWith(
              color: theme.cardColor,
              fontSize: 20
            ),
            title: quraniFont.apply(
              color: theme.primaryColor,
              fontSizeFactor: 1.25,
              fontWeightDelta: 0
            ),
            display1: defaultFont.apply(
              color: theme.disabledColor,
              fontSizeFactor: 1.0,
              fontWeightDelta: 0
            ),
            display2: defaultFont.apply(
              color: theme.cardColor,
              fontSizeFactor: 1.0,
              fontWeightDelta: 0
            ),
            display3: defaultFont.apply(
              color: Colors.black87,
              fontSizeFactor: 1.0,
              fontWeightDelta: -1
            ),
            display4: defaultFont.apply(
              color: theme.primaryColorDark,
              fontSizeFactor: 1.25,
              fontWeightDelta: 1
            )
          )
        );
      },
      appInitialRoute: HomeContainer.routeName,
      appOnGenerateRoutes: (BuildContext context) => <String, WidgetBuilder>{
        HomeContainer.routeName: (BuildContext context) => HomeContainer(),
        ChapterDetailsContainer.routeName: (BuildContext context) => ChapterDetailsContainer(),
        SearchContainer.routeName: (BuildContext context) => SearchContainer(),
        ShareContainer.routeName: (BuildContext context) => ShareContainer(),
        BookmarkContainer.routeName: (BuildContext context) => BookmarkContainer(),
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