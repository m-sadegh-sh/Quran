import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/selectors/app_selector.dart';
import 'package:quran/selectors/settings_selector.dart';
import 'package:quran/delegates/generators.dart';

class AppViewModel {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW2P<String, double, ThemeData> appOnGenerateThemeData;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;

  AppViewModel({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode
  });

  static AppViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return AppViewModel(
      appOnGenerateTitle: appOnGenerateTitleSelector(appState),
      appOnGenerateThemeData: appOnGenerateThemeDataSelector(appState),
      appLocalizationsDelegates: appLocalizationsDelegatesSelector(appState),
      appSupportedLocales: appSupportedLocalesSelector(appState),
      settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamilySelector(settingsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsLocaleLanguageCode: settingsLocaleLanguageCodeSelector(settingsState),
      settingsLocaleCountryCode: settingsLocaleCountryCodeSelector(settingsState)
    );
  }
}
