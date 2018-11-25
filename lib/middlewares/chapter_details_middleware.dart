import 'package:quran/data/verse_repository.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/chapter_details_action.dart';

List<Middleware<RootState>> createChapterDetailsMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterDetailsLoadAction>(_createChapterDetailsLoad())
  ];
}

Middleware<RootState> _createChapterDetailsLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsLoadAction;

      final chapterDetailsVerseItems = await VerseRepository().findAllByChapterId(
        castedAction.chapterDetailsChapterItem.id
      );
      
      store.dispatch(ChapterDetailsLoadSucceededAction(
        chapterDetailsVerseItems: chapterDetailsVerseItems
      ));
    } catch(exception) {
      store.dispatch(ChapterDetailsLoadFailedAction(
        chapterDetailsLoadError: exception?.toString()
      ));
    }
  };
}