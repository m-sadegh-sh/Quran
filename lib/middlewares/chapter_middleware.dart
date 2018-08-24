import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';
import 'package:Quran/data/chapter_repository.dart';

List<Middleware<ChapterListState>> createChapterMiddleware() {
  return [
    TypedMiddleware<ChapterListState, LoadChapterListAction>(_createLoadChapterList())
  ];
}

Middleware<ChapterListState> _createLoadChapterList() {
  return (Store<ChapterListState> store, action, NextDispatcher next) async {
    try {
      await ChapterRepository().init("chapters");

      final chapterList = await ChapterRepository().list();
      
      store.dispatch(ChapterListLoadSucceededAction(
        chapterList: List.unmodifiable(chapterList)
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception
      ));
    }

    next(action);
  };
}
