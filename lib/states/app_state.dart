import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/app_localizations.dart';
import 'package:Quran/containers/about_container.dart';
import 'package:Quran/containers/help_and_support_container.dart';
import 'package:Quran/containers/home_container.dart';
import 'package:Quran/containers/search_container.dart';
import 'package:Quran/containers/settings_container.dart';

class AppState {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final GenerateWithContext<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  
  AppState({
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  });

  factory AppState.initial() => AppState(
    appOnGenerateTitle: (context) => AppLocalizations.of(context).translate('app-title'),
    appTheme: ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.tealAccent,
      fontFamily: 'IranSans'
    ),
    appInitialRoute: '/',
    appOnGenerateRoutes: (BuildContext context) => <String, WidgetBuilder>{
      '/': (BuildContext context) => HomeContainer(),
      '/home': (BuildContext context) => HomeContainer(),
      '/search': (BuildContext context) => SearchContainer(),
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
    ]
  );
}