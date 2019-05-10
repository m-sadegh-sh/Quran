import 'package:redux/redux.dart';

import 'package:quran/states/settings.state.dart';
import 'package:quran/actions/settings.action.dart';

final Reducer<SettingsState> settingsReducer = combineReducers([
  TypedReducer<SettingsState, SettingsReloadInitialStateSucceededAction>(_settingsReloadInitialStateSucceeded),
  TypedReducer<SettingsState, SettingsSharedPreferencesLoadSucceededAction>(_settingsSharedPreferencesLoadSucceeded),
  TypedReducer<SettingsState, SettingsSharedPreferencesPersistSucceededAction>(_settingsSharedPreferencesPersistSucceeded)
]);

SettingsState _settingsReloadInitialStateSucceeded(SettingsState state, SettingsReloadInitialStateSucceededAction action) {
  return action.settingsState;
}

SettingsState _settingsSharedPreferencesLoadSucceeded(SettingsState state, SettingsSharedPreferencesLoadSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLanguageCode: action.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: action.settingsLocaleCountryCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}

SettingsState _settingsSharedPreferencesPersistSucceeded(SettingsState state, SettingsSharedPreferencesPersistSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLanguageCode: action.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: action.settingsLocaleCountryCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}
