import 'package:Quran/actions/chapter_details_action.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';
import 'package:Quran/data/chapter_repository.dart';

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

      await ChapterRepository().init();

      final chapterListItems = await ChapterRepository().list();
      
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

      store.dispatch(ChapterDetailsLoadAction(
        chapterDetailsChapterItemId: (action as ChapterListItemTappedAction).chapterListTappedItemId
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception?.toString()
      ));
    }
  };
}