import 'package:redux/redux.dart';

import 'package:quran/states/settings.state.dart';
import 'package:quran/actions/settings.action.dart';

final Reducer<SettingsState> settingsReducer = combineReducers([
  TypedReducer<SettingsState, SettingsReloadInitialStateSucceededAction>(_settingsReloadInitialStateSucceeded),
  TypedReducer<SettingsState, SettingsLoadSucceededAction>(_settingsLoadSucceeded),
  TypedReducer<SettingsState, SettingsPersistSucceededAction>(_settingsPersistSucceeded)
]);

SettingsState _settingsReloadInitialStateSucceeded(SettingsState state, SettingsReloadInitialStateSucceededAction action) {
  return action.settingsState;
}

SettingsState _settingsLoadSucceeded(SettingsState state, SettingsLoadSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLanguageCode: action.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: action.settingsLocaleCountryCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}

SettingsState _settingsPersistSucceeded(SettingsState state, SettingsPersistSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLanguageCode: action.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: action.settingsLocaleCountryCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}
