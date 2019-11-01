import 'package:redux/redux.dart';

import 'package:quran/actions/chapter_list.action.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/home.action.dart';

List<Middleware<RootState>> createHomeMiddleware() {
  return [
    TypedMiddleware<RootState, HomeSearchOpenAction>(_createHomeSearchOpen()),
    TypedMiddleware<RootState, HomeSearchCloseAction>(_createHomeSearchClose()),
    TypedMiddleware<RootState, HomeSearchQueryChangingAction>(_createHomeSearchQueryChanging()),
    TypedMiddleware<RootState, HomeActionChildItemPressedAction>(_createHomeActionChildItemPressed())
  ];
}

Middleware<RootState> _createHomeSearchOpen() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      next(action);
    } catch(exception) { }
  };
}

Middleware<RootState> _createHomeSearchClose() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      next(action);

      final castedAction = action as HomeSearchCloseAction;
   
      store.dispatch(ChapterListLoadAction(
        homeSearchQuery: null,
        settingsTranslatorId: castedAction.settingsTranslatorId
      ));
    } catch(exception) { }
  };
}

Middleware<RootState> _createHomeSearchQueryChanging() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as HomeSearchQueryChangingAction;
   
      store.dispatch(ChapterListLoadAction(
        homeSearchQuery: castedAction.homeSearchChangingQuery,
        settingsTranslatorId: castedAction.settingsTranslatorId
      ));

      store.dispatch(HomeSearchQueryChangeSucceededAction(
        homeSearchChangedQuery: castedAction.homeSearchChangingQuery
      ));
    } catch(exception) { }
  };
}

Middleware<RootState> _createHomeActionChildItemPressed() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as HomeActionChildItemPressedAction;
   
      if (castedAction.homeActionChildItemType == ActionChildItemType.ChangeFontSize)
        store.dispatch(SettingsPersistAction(
          settingsThemeFontSize: castedAction.homeValue as double
        ));
    } catch(exception) { }
  };
}
