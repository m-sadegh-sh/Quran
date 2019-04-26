import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/states/app_state.dart';
import 'package:quran/actions/app_action.dart';

const APP_THEME_QURANI_FONT_FAMILY_KEY = "rootState.appState.appTheme.textTheme.quraniFontFamily";
const APP_THEME_QURANI_FONT_SIZE_FACTOR_KEY = "rootState.appState.appTheme.textTheme.quraniFontSizeFactor";
const APP_LOCALE_LANGUAGE_CODE_KEY = "rootState.appState.appLocale.languageCode";
const APP_LOCALE_COUNTRY_CODE_KEY = "rootState.appState.appLocale.countryCode";
const APP_TRANSLATOR_ID_KEY = "rootState.appState.appTranslatorId";

List<Middleware<RootState>> createAppMiddleware() {
  return [
    TypedMiddleware<RootState, AppReloadInitialStateAction>(_createAppReloadInitialState()),
    TypedMiddleware<RootState, AppSharedPreferencesLoadAction>(_createAppSharedPreferencesLoad()),
    TypedMiddleware<RootState, AppSharedPreferencesPersistAction>(_createAppSharedPreferencesPersist())
  ];
}

Middleware<RootState> _createAppReloadInitialState() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(AppReloadInitialStateSucceededAction(
        appState: AppState.initial()
      ));
    } catch(exception) {
      store.dispatch(AppReloadInitialStateFailedAction());
    }
  };
}

Middleware<RootState> _createAppSharedPreferencesLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final sharedPreferences = await SharedPreferences.getInstance();

      final newAppThemeQuraniFontFamily = sharedPreferences.getString(APP_THEME_QURANI_FONT_FAMILY_KEY);
      final newAppThemeQuraniFontSizeFactor = sharedPreferences.getDouble(APP_THEME_QURANI_FONT_SIZE_FACTOR_KEY);
      final newAppLocaleLanguageCode = sharedPreferences.getString(APP_LOCALE_LANGUAGE_CODE_KEY);
      final newAppLocaleCountryCode = sharedPreferences.getString(APP_LOCALE_COUNTRY_CODE_KEY);
      final newAppTranslatorId = sharedPreferences.getInt(APP_TRANSLATOR_ID_KEY);

      store.dispatch(AppSharedPreferencesLoadSucceededAction(
        appThemeQuraniFontFamily: newAppThemeQuraniFontFamily,
        appThemeQuraniFontSizeFactor: newAppThemeQuraniFontSizeFactor,
        appLocaleLanguageCode: newAppLocaleLanguageCode,
        appLocaleCountryCode: newAppLocaleCountryCode,
        appTranslatorId: newAppTranslatorId
      ));
    } catch(exception) {
      store.dispatch(AppSharedPreferencesLoadSucceededAction());
    }
  };
}

Middleware<RootState> _createAppSharedPreferencesPersist() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as AppSharedPreferencesPersistAction;

      final sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString(APP_THEME_QURANI_FONT_FAMILY_KEY, castedAction.appThemeQuraniFontFamily);
      sharedPreferences.setDouble(APP_THEME_QURANI_FONT_SIZE_FACTOR_KEY, castedAction.appThemeQuraniFontSizeFactor);
      sharedPreferences.setString(APP_LOCALE_LANGUAGE_CODE_KEY, castedAction.appLocaleLanguageCode);
      sharedPreferences.setString(APP_LOCALE_COUNTRY_CODE_KEY, castedAction.appLocaleCountryCode);
      sharedPreferences.setInt(APP_TRANSLATOR_ID_KEY, castedAction.appTranslatorId);

      store.dispatch(AppSharedPreferencesPersistSucceededAction());
    } catch(exception) {
      store.dispatch(AppSharedPreferencesPersistFailedAction());
    }
  };
}
