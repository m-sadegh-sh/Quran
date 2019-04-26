
import 'package:quran/states/app_state.dart';

class AppReloadInitialStateAction { }

class AppReloadInitialStateSucceededAction {
  final AppState appState;

  AppReloadInitialStateSucceededAction({
    this.appState
  });
}

class AppReloadInitialStateFailedAction { }

class AppSharedPreferencesLoadAction { }

class AppSharedPreferencesLoadSucceededAction {
  final String appThemeQuraniFontFamily;
  final double appThemeQuraniFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesLoadSucceededAction({
    this.appThemeQuraniFontFamily,
    this.appThemeQuraniFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesLoadFailedAction {}
  
class AppSharedPreferencesPersistAction {
  final String appThemeQuraniFontFamily;
  final double appThemeQuraniFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesPersistAction({
    this.appThemeQuraniFontFamily,
    this.appThemeQuraniFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesPersistSucceededAction { }

class AppSharedPreferencesPersistFailedAction { }