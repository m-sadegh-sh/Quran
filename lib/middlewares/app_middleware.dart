import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/states/app_state.dart';
import 'package:quran/actions/app_action.dart';

List<Middleware<RootState>> createAppMiddleware() {
  return [
    TypedMiddleware<RootState, AppReloadInitialStateAction>(_createAppReloadInitialState())
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
