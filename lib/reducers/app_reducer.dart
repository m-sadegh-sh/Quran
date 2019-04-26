import 'package:redux/redux.dart';

import 'package:quran/states/app_state.dart';
import 'package:quran/actions/app_action.dart';

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AppReloadInitialStateSucceededAction>(_appReloadInitialStateSucceeded)
]);

AppState _appReloadInitialStateSucceeded(AppState state, AppReloadInitialStateSucceededAction action) {
  return action.appState;
}
