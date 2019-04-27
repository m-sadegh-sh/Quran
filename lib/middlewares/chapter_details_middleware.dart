import 'package:redux/redux.dart';

import 'package:quran/data/verse_repository.dart';
import 'package:quran/states/root_state.dart';
import 'package:quran/states/chapter_details_state.dart';
import 'package:quran/actions/chapter_details_action.dart';
import 'package:quran/actions/settings_action.dart';

List<Middleware<RootState>> createChapterDetailsMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterDetailsReloadInitialStateAction>(_createChapterDetailsReloadInitialState()),
    TypedMiddleware<RootState, ChapterDetailsLoadAction>(_createChapterDetailsLoad()),
    TypedMiddleware<RootState, ChapterDetailsActionChildItemPressedAction>(_createChapterDetailsActionChildItemPressed())
  ];
}

Middleware<RootState> _createChapterDetailsReloadInitialState() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(ChapterDetailsReloadInitialStateSucceededAction(
        chapterDetailsState: ChapterDetailsState.initial()
      ));
    } catch(exception) {
      store.dispatch(ChapterDetailsReloadInitialStateFailedAction());
    }
  };
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

Middleware<RootState> _createChapterDetailsActionChildItemPressed() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsActionChildItemPressedAction;
   
      if (castedAction.actionChildItem.actionName == 'change-font-size')
        store.dispatch(SettingsSharedPreferencesPersistAction(
          settingsThemeFontSize: castedAction.actionChildItem.value as double
        ));
    } catch(exception) { }
  };
}
