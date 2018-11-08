import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';
import 'package:Quran/actions/chapter_details_action.dart';
import 'package:Quran/data/translator_repository.dart';
import 'package:Quran/data/chapter_repository.dart';
import 'package:Quran/data/chapter_translation_repository.dart';
import 'package:Quran/data/verse_repository.dart';
import 'package:Quran/data/verse_translation_repository.dart';

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

      store.dispatch(ChapterDetailsLoadAction(
        chapterDetailsChapterItem: (action as ChapterListItemTappedAction).chapterListTappedItem
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception?.toString()
      ));
    }
  };
}