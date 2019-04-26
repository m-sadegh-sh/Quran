import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/selectors/app_selector.dart';
import 'package:quran/delegates/generators.dart';

class AppViewModel {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorWNP<ThemeData> appOnGenerateThemeData;
  final String appInitialRoute;
  final GeneratorWNP<Map<String, WidgetBuilder>> appOnGenerateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appLocale;

  AppViewModel({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appInitialRoute,
    this.appOnGenerateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.appLocale
  });

  static AppViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);

    return AppViewModel(
      appOnGenerateTitle: appOnGenerateTitleSelector(appState),
      appOnGenerateThemeData: appOnGenerateThemeDataSelector(appState),
      appInitialRoute: appInitialRouteSelector(appState),
      appOnGenerateRoutes: appOnGenerateRoutesSelector(appState),
      appLocalizationsDelegates: appLocalizationsDelegatesSelector(appState),
      appSupportedLocales: appSupportedLocalesSelector(appState),
      appLocale: appLocaleSelector(appState)
    );
  }
}
