import 'package:redux/redux.dart';

import 'package:quran/states/app_state.dart';
import 'package:quran/actions/app_action.dart';

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AppReloadInitialStateSucceededAction>(_appReloadInitialStateSucceeded),
  TypedReducer<AppState, AppSharedPreferencesLoadSucceededAction>(_appSharedPreferencesLoadSucceeded)
]);

AppState _appReloadInitialStateSucceeded(AppState state, AppReloadInitialStateSucceededAction action) {
  return action.appState;
}

AppState _appSharedPreferencesLoadSucceeded(AppState state, AppSharedPreferencesLoadSucceededAction action) {
  return state.copyWith(
    appThemeFontFamily: action.appThemeFontFamily,
    appThemeFontSizeFactor: action.appThemeFontSizeFactor,
    appLocaleLanguageCode: action.appLocaleLanguageCode,
    appLocaleCountryCode: action.appLocaleCountryCode,
    appTranslatorId: action.appTranslatorId
  );
}
