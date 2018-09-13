import 'package:Quran/data/verse_repository.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_details_action.dart';
import 'package:Quran/data/chapter_repository.dart';

List<Middleware<RootState>> createChapterDetailsMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterDetailsLoadAction>(_createChapterDetailsLoad())
  ];
}

Middleware<RootState> _createChapterDetailsLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final chapterDetailsChapterItem = await ChapterRepository().findOneById(
        (action as ChapterDetailsLoadAction).chapterDetailsChapterItemId
      );
      
      final chapterDetailsVerseItems = await VerseRepository().findAllByChapterId(
        (action as ChapterDetailsLoadAction).chapterDetailsChapterItemId
      );
      
      store.dispatch(ChapterDetailsLoadSucceededAction(
        chapterDetailsChapterItem: chapterDetailsChapterItem,
        chapterDetailsVerseItems: chapterDetailsVerseItems
      ));
    } catch(exception) {
      store.dispatch(ChapterDetailsLoadFailedAction(
        chapterDetailsLoadError: exception?.toString()
      ));
    }
  };
}