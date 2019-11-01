import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/states/settings.state.dart';
import 'package:quran/actions/settings.action.dart';

const SETTINGS_THEME_QURANI_FONT_FAMILY_KEY = "rootState.settingsState.settingsTheme.textTheme.quraniFontFamily";
const SETTINGS_THEME_FONT_SIZE_KEY = "rootState.settingsState.settingsTheme.textTheme.fontSize";
const SETTINGS_LOCALE_LOCALE_CODE_KEY = "rootState.settingsState.settingsLocale.localeCode";
const SETTINGS_TRANSLATOR_ID_KEY = "rootState.settingsState.settingsTranslatorId";

List<Middleware<RootState>> createSettingsMiddleware() {
  return [
    TypedMiddleware<RootState, SettingsLoadAction>(_createSettingsLoad()),
    TypedMiddleware<RootState, SettingsPersistAction>(_createSettingsPersist()),
    TypedMiddleware<RootState, SettingsRestoreDefaultsAction>(_createSettingsRestoreDefaults())
  ];
}

Middleware<RootState> _createSettingsLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final sharedPreferences = await SharedPreferences.getInstance();

      final newSettingsThemeQuraniFontFamily = sharedPreferences.getString(SETTINGS_THEME_QURANI_FONT_FAMILY_KEY);
      final newSettingsThemeFontSize = sharedPreferences.getDouble(SETTINGS_THEME_FONT_SIZE_KEY);
      final newsettingsLocaleLocaleCode = sharedPreferences.getString(SETTINGS_LOCALE_LOCALE_CODE_KEY);
      final newSettingsTranslatorId = sharedPreferences.getInt(SETTINGS_TRANSLATOR_ID_KEY);

      store.dispatch(SettingsLoadSucceededAction(
        settingsThemeQuraniFontFamily: newSettingsThemeQuraniFontFamily,
        settingsThemeFontSize: newSettingsThemeFontSize,
        settingsLocaleLocaleCode: newsettingsLocaleLocaleCode,
        settingsTranslatorId: newSettingsTranslatorId
      ));
    } catch(exception) {
      store.dispatch(SettingsLoadFailedAction());
    }
  };
}

Middleware<RootState> _createSettingsPersist() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as SettingsPersistAction;

      final sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString(SETTINGS_THEME_QURANI_FONT_FAMILY_KEY, castedAction.settingsThemeQuraniFontFamily);
      sharedPreferences.setDouble(SETTINGS_THEME_FONT_SIZE_KEY, castedAction.settingsThemeFontSize);
      sharedPreferences.setString(SETTINGS_LOCALE_LOCALE_CODE_KEY, castedAction.settingsLocaleLocaleCode);
      sharedPreferences.setInt(SETTINGS_TRANSLATOR_ID_KEY, castedAction.settingsTranslatorId);

      store.dispatch(SettingsPersistSucceededAction(
        settingsThemeQuraniFontFamily: castedAction.settingsThemeQuraniFontFamily,
        settingsThemeFontSize: castedAction.settingsThemeFontSize,
        settingsLocaleLocaleCode: castedAction.settingsLocaleLocaleCode,
        settingsTranslatorId: castedAction.settingsTranslatorId
      ));
    } catch(exception) {
      store.dispatch(SettingsPersistFailedAction());
    }
  };
}

Middleware<RootState> _createSettingsRestoreDefaults() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final initialSettingsState = SettingsState.initial();

      store.dispatch(SettingsPersistAction(
        settingsThemeQuraniFontFamily: initialSettingsState.settingsThemeQuraniFontFamily,
        settingsThemeFontSize: initialSettingsState.settingsThemeFontSize,
        settingsLocaleLocaleCode: initialSettingsState.settingsLocaleLocaleCode,
        settingsTranslatorId: initialSettingsState.settingsTranslatorId
      ));
    } catch(exception) { }
  };
}
