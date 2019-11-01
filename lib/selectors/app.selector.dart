import 'package:flutter/material.dart';

import 'package:quran/states/app.state.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/delegates/generator.delegate.dart';

AppState appStateSelector(RootState state) => state.appState;
GenerateAppTitle appOnGenerateTitleSelector(AppState state) => state.appOnGenerateTitle;
GeneratorW3P<String, double, String, ThemeData> appOnGenerateThemeDataSelector(AppState state) => state.appOnGenerateThemeData;
List<LocalizationsDelegate> appLocalizationsDelegatesSelector(AppState state) => state.appLocalizationsDelegates;
List<Locale> appSupportedLocalesSelector(AppState state) => state.appSupportedLocales;
