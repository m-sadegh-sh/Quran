import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/states/home_state.dart';
import 'package:quran/actions/settings_action.dart';
import 'package:quran/actions/home_action.dart';

List<Middleware<RootState>> createHomeMiddleware() {
  return [
    TypedMiddleware<RootState, HomeReloadInitialStateAction>(_createHomeReloadInitialState()),
    TypedMiddleware<RootState, HomeActionChildItemPressedAction>(_createHomeActionChildItemPressed())
  ];
}

Middleware<RootState> _createHomeReloadInitialState() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(HomeReloadInitialStateSucceededAction(
        homeState: HomeState.initial()
      ));
    } catch(exception) {
      store.dispatch(HomeReloadInitialStateFailedAction());
    }
  };
}

Middleware<RootState> _createHomeActionChildItemPressed() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as HomeActionChildItemPressedAction;
   
      if (castedAction.actionChildItem.actionName == 'change-font-size')
        store.dispatch(SettingsSharedPreferencesPersistAction(
          settingsThemeQuraniFontSize: castedAction.actionChildItem.value as double
        ));
    } catch(exception) {
      store.dispatch(HomeReloadInitialStateFailedAction());
    }
  };
}
