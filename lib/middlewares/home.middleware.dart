import 'package:redux/redux.dart';

import 'package:quran/actions/chapter_list.action.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/home.state.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/home.action.dart';

List<Middleware<RootState>> createHomeMiddleware() {
  return [
    TypedMiddleware<RootState, HomeReloadInitialStateAction>(_createHomeReloadInitialState()),
    TypedMiddleware<RootState, HomeSearchQueryChangingAction>(_createHomeSearchQueryChanging()),
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

Middleware<RootState> _createHomeSearchQueryChanging() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as HomeSearchQueryChangingAction;
   
      store.dispatch(ChapterListLoadAction(
        homeSearchQuery: castedAction.homeSearchChangingQuery
      ));

      store.dispatch(HomeSearchQueryChangeSucceededAction(
        homeSearchChangedQuery: castedAction.homeSearchChangingQuery
      ));
    } catch(exception) {
      store.dispatch(HomeSearchQueryChangeFailedAction());
    }
  };
}

Middleware<RootState> _createHomeActionChildItemPressed() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as HomeActionChildItemPressedAction;
   
      if (castedAction.homeActionChildItemType == ActionChildItemType.ChangeFontSize)
        store.dispatch(SettingsSharedPreferencesPersistAction(
          settingsThemeFontSize: castedAction.homeValue as double
        ));
    } catch(exception) { }
  };
}
