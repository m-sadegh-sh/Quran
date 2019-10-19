import 'package:redux/redux.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/repositories/verse.repository.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/chapter_details.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/common.action.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SETTINGS_THEME_QURANI_FONT_FAMILY_KEY = "rootState.bookmarkListState.bookmarkListedVerseIds";

List<Middleware<RootState>> createBookmarkListMiddleware() {
  return [
    TypedMiddleware<RootState, BookmarkListReloadInitialStateAction>(_createBookmarkListReloadInitialState()),
    TypedMiddleware<RootState, BookmarkListSlidableActionTappedAction>(_createBookmarkListSlidableActionTapped())
  ];
}

Middleware<RootState> _createBookmarkListReloadInitialState() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(BookmarkListReloadInitialStateSucceededAction(
        bookmarkListState: BookmarkListState.initial()
      ));
    } catch(exception) {
      store.dispatch(BookmarkListReloadInitialStateFailedAction());
    }
  };
}

Middleware<RootState> _createBookmarkListAddVerse() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as BookmarkListAddVerseAction;
   
      final sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.getStringList(key)
    } catch(exception) {
      store.dispatch(BookmarkListAddVerseFailedAction());
    }
  };
}
