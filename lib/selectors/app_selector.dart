import 'package:flutter/material.dart';

import 'package:Quran/states/app_state.dart';
import 'package:Quran/states/root_state.dart';
import 'package:Quran/delegates/create_routes_delegate.dart';

AppState appStateSelector(RootState state) => state.appState;
GenerateAppTitle appOnGenerateTitleSelector(AppState state) => state.appOnGenerateTitle;
ThemeData appThemeSelector(AppState state) => state.appTheme;
String appInitialRouteSelector(AppState state) => state.appInitialRoute;
CreateRoutes appOnCreateRoutesSelector(AppState state) => state.appOnCreateRoutes;
List<LocalizationsDelegate> appLocalizationsDelegatesSelector(AppState state) => state.appLocalizationsDelegates;
List<Locale> appSupportedLocalesSelector(AppState state) => state.appSupportedLocales;