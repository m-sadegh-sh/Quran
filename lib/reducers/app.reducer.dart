import 'package:redux/redux.dart';

import 'package:quran/states/app.state.dart';
import 'package:quran/actions/app.action.dart';

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AppReloadInitialStateSucceededAction>(_appReloadInitialStateSucceeded)
]);

AppState _appReloadInitialStateSucceeded(AppState state, AppReloadInitialStateSucceededAction action) {
  return action.appState;
}
