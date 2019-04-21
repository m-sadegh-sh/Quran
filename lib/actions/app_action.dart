
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
  final String appThemeFontFamily;
  final double appThemeFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesLoadSucceededAction({
    this.appThemeFontFamily,
    this.appThemeFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesLoadFailedAction {}
  
class AppSharedPreferencesPersistAction {
  final String appThemeFontFamily;
  final double appThemeFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesPersistAction({
    this.appThemeFontFamily,
    this.appThemeFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesPersistSucceededAction { }

class AppSharedPreferencesPersistFailedAction { }