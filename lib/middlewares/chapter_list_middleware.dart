import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';
import 'package:Quran/data/chapter_repository.dart';

List<Middleware<RootState>> createChapterListMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterListLoadAction>(_createChapterListLoad())
  ];
}

Middleware<RootState> _createChapterListLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
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

    next(action);
  };
}