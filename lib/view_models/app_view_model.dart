import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/selectors/app_selector.dart';
import 'package:Quran/delegates/create_routes_delegate.dart';

class AppViewModel {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final CreateRoutes appOnCreateRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  
  AppViewModel({
    this.appOnGenerateTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appOnCreateRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  });

  static AppViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);

    return AppViewModel(
      appOnGenerateTitle: appOnGenerateTitleSelector(appState),
      appTheme: appThemeSelector(appState),
      appInitialRoute: appInitialRouteSelector(appState),
      appOnCreateRoutes: appOnCreateRoutesSelector(appState),
      appLocalizationsDelegates: appLocalizationsDelegatesSelector(appState),
      appSupportedLocales: appSupportedLocalesSelector(appState)
    );
  }
}
