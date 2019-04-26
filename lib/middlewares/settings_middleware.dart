import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/states/settings_state.dart';
import 'package:quran/actions/settings_action.dart';

const SETTINGS_THEME_QURANI_FONT_FAMILY_KEY = "rootState.settingsState.settingsTheme.textTheme.quraniFontFamily";
const SETTINGS_THEME_QURANI_FONT_SIZE_KEY = "rootState.settingsState.settingsTheme.textTheme.quraniFontSize";
const SETTINGS_LOCALE_LANGUAGE_CODE_KEY = "rootState.settingsState.settingsLocale.languageCode";
const SETTINGS_LOCALE_COUNTRY_CODE_KEY = "rootState.settingsState.settingsLocale.countryCode";
const SETTINGS_TRANSLATOR_ID_KEY = "rootState.settingsState.settingsTranslatorId";

List<Middleware<RootState>> createSettingsMiddleware() {
  return [
    TypedMiddleware<RootState, SettingsReloadInitialStateAction>(_createSettingsReloadInitialState()),
    TypedMiddleware<RootState, SettingsSharedPreferencesLoadAction>(_createSettingsSharedPreferencesLoad()),
    TypedMiddleware<RootState, SettingsSharedPreferencesPersistAction>(_createSettingsSharedPreferencesPersist())
  ];
}

Middleware<RootState> _createSettingsReloadInitialState() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(SettingsReloadInitialStateSucceededAction(
        settingsState: SettingsState.initial()
      ));
    } catch(exception) {
      store.dispatch(SettingsReloadInitialStateFailedAction());
    }
  };
}

Middleware<RootState> _createSettingsSharedPreferencesLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final sharedPreferences = await SharedPreferences.getInstance();

      final newSettingsThemeQuraniFontFamily = sharedPreferences.getString(SETTINGS_THEME_QURANI_FONT_FAMILY_KEY);
      final newSettingsThemeQuraniFontSize = sharedPreferences.getDouble(SETTINGS_THEME_QURANI_FONT_SIZE_KEY);
      final newSettingsLocaleLanguageCode = sharedPreferences.getString(SETTINGS_LOCALE_LANGUAGE_CODE_KEY);
      final newSettingsLocaleCountryCode = sharedPreferences.getString(SETTINGS_LOCALE_COUNTRY_CODE_KEY);
      final newSettingsTranslatorId = sharedPreferences.getInt(SETTINGS_TRANSLATOR_ID_KEY);

      store.dispatch(SettingsSharedPreferencesLoadSucceededAction(
        settingsThemeQuraniFontFamily: newSettingsThemeQuraniFontFamily,
        settingsThemeQuraniFontSize: newSettingsThemeQuraniFontSize,
        settingsLocaleLanguageCode: newSettingsLocaleLanguageCode,
        settingsLocaleCountryCode: newSettingsLocaleCountryCode,
        settingsTranslatorId: newSettingsTranslatorId
      ));
    } catch(exception) {
      store.dispatch(SettingsSharedPreferencesLoadSucceededAction());
    }
  };
}

Middleware<RootState> _createSettingsSharedPreferencesPersist() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as SettingsSharedPreferencesPersistAction;

      final sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString(SETTINGS_THEME_QURANI_FONT_FAMILY_KEY, castedAction.settingsThemeQuraniFontFamily);
      sharedPreferences.setDouble(SETTINGS_THEME_QURANI_FONT_SIZE_KEY, castedAction.settingsThemeQuraniFontSize);
      sharedPreferences.setString(SETTINGS_LOCALE_LANGUAGE_CODE_KEY, castedAction.settingsLocaleLanguageCode);
      sharedPreferences.setString(SETTINGS_LOCALE_COUNTRY_CODE_KEY, castedAction.settingsLocaleCountryCode);
      sharedPreferences.setInt(SETTINGS_TRANSLATOR_ID_KEY, castedAction.settingsTranslatorId);

      store.dispatch(SettingsSharedPreferencesPersistSucceededAction());
    } catch(exception) {
      store.dispatch(SettingsSharedPreferencesPersistFailedAction());
    }
  };
}
