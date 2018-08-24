import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/delegates/create_routes_delegate.dart';
import 'package:Quran/app_localizations.dart';
import 'package:Quran/containers/about_container.dart';
import 'package:Quran/containers/help_and_support_container.dart';
import 'package:Quran/containers/home_container.dart';
import 'package:Quran/containers/search_container.dart';
import 'package:Quran/containers/settings_container.dart';

class AppState {
  GenerateAppTitle appOnGenerateTitle;
  ThemeData appTheme;
  String appInitialRoute;
  CreateRoutes appOnCreateRoutes;
  List<LocalizationsDelegate> appLocalizationsDelegates;
  List<Locale> appSupportedLocales;
  
  AppState({
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnCreateRoutes,
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
    appOnCreateRoutes: (BuildContext context) => <String, WidgetBuilder>{
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