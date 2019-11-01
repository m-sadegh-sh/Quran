import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';

const SETTINGS_THEME_QURANI_FONT_FAMILY_KEY = "rootState.bookmarkListState.bookmarkListedVerseIds";

List<Middleware<RootState>> createBookmarkListMiddleware() {
  return [
    //TypedMiddleware<RootState, BookmarkListSlidableActionTappedAction>(_createBookmarkListSlidableActionTapped())
  ];
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
