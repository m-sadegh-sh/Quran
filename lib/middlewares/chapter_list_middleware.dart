import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/chapter_list_action.dart';
import 'package:quran/actions/chapter_details_action.dart';
import 'package:quran/data/chapter_repository.dart';

List<Middleware<RootState>> createChapterListMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterListLoadAction>(_createChapterListLoad()),
    TypedMiddleware<RootState, ChapterListItemTappedAction>(_createChapterListItemTapped())
  ];
}

Middleware<RootState> _createChapterListLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final chapterListItems = await ChapterRepository().findAll();

      store.dispatch(ChapterListLoadSucceededAction(
        chapterListItems: chapterListItems
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception?.toString()
      ));
    }
  };
}

Middleware<RootState> _createChapterListItemTapped() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterListItemTappedAction;

      store.dispatch(ChapterDetailsLoadAction(
        chapterDetailsChapterItem: castedAction.chapterListTappedItem
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception?.toString()
      ));
    }
  };
}