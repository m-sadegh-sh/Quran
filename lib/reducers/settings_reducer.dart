import 'package:redux/redux.dart';

import 'package:quran/states/settings_state.dart';
import 'package:quran/actions/settings_action.dart';

final Reducer<SettingsState> settingsReducer = combineReducers([
  TypedReducer<SettingsState, SettingsReloadInitialStateSucceededAction>(_settingsReloadInitialStateSucceeded),
  TypedReducer<SettingsState, SettingsSharedPreferencesLoadSucceededAction>(_settingsSharedPreferencesLoadSucceeded)
]);

SettingsState _settingsReloadInitialStateSucceeded(SettingsState state, SettingsReloadInitialStateSucceededAction action) {
  return action.settingsState;
}

SettingsState _settingsSharedPreferencesLoadSucceeded(SettingsState state, SettingsSharedPreferencesLoadSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeQuraniFontSize: action.settingsThemeQuraniFontSize,
    settingsLocaleLanguageCode: action.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: action.settingsLocaleCountryCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}
