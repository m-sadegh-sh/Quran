import 'package:redux/redux.dart';

import 'package:quran/states/settings.state.dart';
import 'package:quran/actions/settings.action.dart';

final Reducer<SettingsState> settingsReducer = combineReducers([
  TypedReducer<SettingsState, SettingsLoadSucceededAction>(_settingsLoadSucceeded),
  TypedReducer<SettingsState, SettingsPersistSucceededAction>(_settingsPersistSucceeded),
  TypedReducer<SettingsState, SettingsActionItemPressedAction>(_settingsActionItemPressed)
]);

SettingsState _settingsLoadSucceeded(SettingsState state, SettingsLoadSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLocaleCode: action.settingsLocaleLocaleCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}

SettingsState _settingsPersistSucceeded(SettingsState state, SettingsPersistSucceededAction action) {
  return state.copyWith(
    settingsThemeQuraniFontFamily: action.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: action.settingsThemeFontSize,
    settingsLocaleLocaleCode: action.settingsLocaleLocaleCode,
    settingsTranslatorId: action.settingsTranslatorId
  );
}

SettingsState _settingsActionItemPressed(SettingsState state, SettingsActionItemPressedAction action) {
  action.settingsActionItem.onDispatchAction(action.context, action.store);

  return state;
}
