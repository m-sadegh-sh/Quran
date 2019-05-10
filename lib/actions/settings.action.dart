
import 'package:quran/states/settings.state.dart';

class SettingsReloadInitialStateAction { }

class SettingsReloadInitialStateSucceededAction {
  final SettingsState settingsState;

  SettingsReloadInitialStateSucceededAction({
    this.settingsState
  });
}

class SettingsReloadInitialStateFailedAction { }

class SettingsSharedPreferencesLoadAction { }

class SettingsSharedPreferencesLoadSucceededAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;

  SettingsSharedPreferencesLoadSucceededAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });
}

class SettingsSharedPreferencesLoadFailedAction {}
  
class SettingsSharedPreferencesPersistAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;

  SettingsSharedPreferencesPersistAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });
}

class SettingsSharedPreferencesPersistSucceededAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;

  SettingsSharedPreferencesPersistSucceededAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });
}

class SettingsSharedPreferencesPersistFailedAction { }