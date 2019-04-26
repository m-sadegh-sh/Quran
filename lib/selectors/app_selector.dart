import 'package:flutter/material.dart';

import 'package:quran/states/app_state.dart';
import 'package:quran/states/root_state.dart';
import 'package:quran/delegates/generators.dart';

AppState appStateSelector(RootState state) => state.appState;
GenerateAppTitle appOnGenerateTitleSelector(AppState state) => state.appOnGenerateTitle;
GeneratorWNP<ThemeData> appOnGenerateThemeDataSelector(AppState state) => state.appOnGenerateThemeData;
String appInitialRouteSelector(AppState state) => state.appInitialRoute;
GeneratorWNP<Map<String, WidgetBuilder>> appOnGenerateRoutesSelector(AppState state) => state.appOnGenerateRoutes;
List<LocalizationsDelegate> appLocalizationsDelegatesSelector(AppState state) => state.appLocalizationsDelegates;
List<Locale> appSupportedLocalesSelector(AppState state) => state.appSupportedLocales;
Locale appLocaleSelector(AppState state) => state.appLocale;
int appTranslatorIdSelector(AppState state) => state.appTranslatorId;