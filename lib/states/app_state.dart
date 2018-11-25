import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran/delegates/generate_with_context.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/containers/home_container.dart';
import 'package:quran/containers/chapter_details_container.dart';
import 'package:quran/containers/search_container.dart';
import 'package:quran/containers/share_container.dart';
import 'package:quran/containers/help_and_support_container.dart';
import 'package:quran/containers/settings_container.dart';
import 'package:quran/containers/about_container.dart';

class AppState {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final GenerateWithContext<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appLocale;
  final int appTranslatorId;
  
  AppState({
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.appLocale,
    this.appTranslatorId
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
      Locale('fa', 'IR'),
    ],
    appLocale: Locale('fa', 'IR'),
    appTranslatorId: 1
  );
  
  AppState copyWith({
    String appThemeFontFamily,
    String appLocaleLanguageCode,
    String appLocaleCountryCode,
    int appTranslatorId
  }) => AppState(
    appTheme: (appThemeFontFamily?.isNotEmpty ?? false) ? appTheme.copyWith(
      textTheme: appTheme.textTheme.apply(
        fontFamily: appThemeFontFamily
      )
    ) : this.appTheme,
    appLocale: (appLocaleLanguageCode?.isNotEmpty ?? false) && (appLocaleCountryCode?.isNotEmpty ?? false) ? Locale(appLocaleLanguageCode, appLocaleCountryCode) : this.appLocale,
    appTranslatorId: appTranslatorId ?? this.appTranslatorId
  );
}