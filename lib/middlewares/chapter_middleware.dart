import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_state.dart';
import 'package:Quran/actions/chapter_actions.dart';
import 'package:Quran/data/chapter_repository.dart';

List<Middleware<ChapterState>> createChapterMiddleware() {
  return [
    TypedMiddleware<ChapterState, LoadChapterListAction>(_createLoadChapterList())
  ];
}

Middleware<ChapterState> _createLoadChapterList() {
  return (Store<ChapterState> store, action, NextDispatcher next) async {
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
