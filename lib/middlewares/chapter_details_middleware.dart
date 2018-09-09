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

      await ChapterRepository().init();

      final chapterDetailsItem = await ChapterRepository().findById(
        (action as ChapterDetailsLoadAction).chapterDetailsItemId
      );
      
      store.dispatch(ChapterDetailsLoadSucceededAction(
        chapterDetailsItem: chapterDetailsItem
      ));
    } catch(exception) {
      store.dispatch(ChapterDetailsLoadFailedAction(
        chapterDetailsLoadError: exception?.toString()
      ));
    }
  };
}