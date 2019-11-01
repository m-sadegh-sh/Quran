import 'package:quran/actions/bookmark_list.action.dart';
import 'package:quran/states/bookmark_list.state.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';

const SETTINGS_THEME_QURANI_FONT_FAMILY_KEY = "rootState.bookmarkListState.bookmarkListedVerseIds";

List<Middleware<RootState>> createBookmarkListMiddleware() {
  return [
    TypedMiddleware<RootState, BookmarkListReloadInitialStateAction>(_createBookmarkListReloadInitialState()),
    //TypedMiddleware<RootState, BookmarkListSlidableActionTappedAction>(_createBookmarkListSlidableActionTapped())
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

// Middleware<RootState> _createBookmarkListAddVerse() {
//   return (Store<RootState> store, action, NextDispatcher next) async {
//     try {
//       next(action);

//       final castedAction = action as BookmarkListAddVerseAction;
   
//       final sharedPreferences = await Shared0Preferences.getInstance();

//       sharedPreferences.getStringList(key);
//     } catch(exception) {
//       store.dispatch(BookmarkListAddVerseFailedAction());
//     }
//   };
// }
