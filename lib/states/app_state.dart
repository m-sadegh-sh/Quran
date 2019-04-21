import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran/delegates/generate_with_context.dart';
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
  final GenerateWithContext<ThemeData> appOnGenerateThemeData;
  final String appInitialRoute;
  final GenerateWithContext<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appLocale;
  final int appTranslatorId;
  
  AppState({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.appLocale,
    this.appTranslatorId
  });

  factory AppState.initial() {
    return AppState(
      appOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('app-title'),
      appOnGenerateThemeData: (BuildContext context) {
        final theme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          accentColor: Colors.tealAccent,
          fontFamily: 'IranSans'
        );

        const iranSans = TextStyle(
          fontFamily: 'IranSans'
        );

        const nabi = TextStyle(
          fontFamily: 'Nabi'
        );

        return theme.copyWith(
          textTheme: TextTheme(
            headline: nabi.copyWith(
              color: theme.cardColor
            ),
            title: nabi.copyWith(
              color: theme.primaryColor
            ),
            display1: iranSans.copyWith(
              color: theme.disabledColor,
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
            display2: iranSans.copyWith(
              color: theme.cardColor,
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
            display4: iranSans.copyWith(
              color: theme.primaryColorDark,
              fontSize: 20,
              fontWeight: FontWeight.w500
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
      ],
      appLocale: Locale('fa', 'IR'),
      appTranslatorId: 1
    );
  }
  
  AppState copyWith({
    String appThemeFontFamily,
    double appThemeFontSizeFactor,
    String appLocaleLanguageCode,
    String appLocaleCountryCode,
    int appTranslatorId
  }) => AppState(
    appOnGenerateThemeData: (BuildContext context) {
      final theme = this.appOnGenerateThemeData(context);

      if (appThemeFontFamily?.isNotEmpty ?? false)
        return theme.copyWith(
          textTheme: theme.textTheme.copyWith(
            headline: theme.textTheme.headline.apply(
              fontSizeFactor: appThemeFontSizeFactor,
              fontFamily: appThemeFontFamily
            ),
            title: theme.textTheme.title.apply(
              fontSizeFactor: appThemeFontSizeFactor,
              fontFamily: appThemeFontFamily
            )
          )
        );

      return theme;
    },
    appLocale: (appLocaleLanguageCode?.isNotEmpty ?? false) && (appLocaleCountryCode?.isNotEmpty ?? false) ? Locale(appLocaleLanguageCode, appLocaleCountryCode) : this.appLocale,
    appTranslatorId: appTranslatorId ?? this.appTranslatorId
  );
}