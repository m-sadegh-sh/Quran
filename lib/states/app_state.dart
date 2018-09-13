import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/app_localizations.dart';
import 'package:Quran/containers/home_container.dart';
import 'package:Quran/containers/chapter_details_container.dart';
import 'package:Quran/containers/search_container.dart';
import 'package:Quran/containers/share_container.dart';
import 'package:Quran/containers/help_and_support_container.dart';
import 'package:Quran/containers/settings_container.dart';
import 'package:Quran/containers/about_container.dart';

class AppState {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final GenerateWithContext<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appCurrentLocale;
  final int appCurrentTranslatorId;
  
  AppState({
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.appCurrentLocale,
    this.appCurrentTranslatorId
  });

  factory AppState.initial() => AppState(
    appOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('app-title'),
    appTheme: ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.tealAccent,
      fontFamily: 'IranSans'
    ),
    appInitialRoute: '/',
    appOnGenerateRoutes: (BuildContext context) => <String, WidgetBuilder>{
      '/': (BuildContext context) => HomeContainer(),
      '/home': (BuildContext context) => HomeContainer(),
      '/chapter-details': (BuildContext context) => ChapterDetailsContainer(),
      '/search': (BuildContext context) => SearchContainer(),
      '/share': (BuildContext context) => ShareContainer(),
      '/help-and-support': (BuildContext context) => HelpAndSupportContainer(),
      '/settings': (BuildContext context) => SettingsContainer(),
      '/about': (BuildContext context) => AboutContainer()
    },
    appLocalizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    appSupportedLocales: [
      const Locale('fa', 'IR'),
    ],
    appCurrentLocale: Locale('fa', 'IR'),
    appCurrentTranslatorId: 1
  );
}