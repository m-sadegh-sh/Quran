import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/app.selector.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';

class AppViewModel {
  final GenerateAppTitle appOnGenerateTitle;
  final GeneratorW3P<String, double, String, ThemeData> appOnGenerateThemeData;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleCode;

  AppViewModel({
    this.appOnGenerateTitle,
    this.appOnGenerateThemeData,
    this.appLocalizationsDelegates,
    this.appSupportedLocales,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleCode
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
      settingsLocaleCode: settingsLocaleCodeSelector(settingsState)
    );
  }
}
