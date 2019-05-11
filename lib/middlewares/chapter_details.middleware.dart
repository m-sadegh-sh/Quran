import 'package:redux/redux.dart';
import 'package:kiwi/kiwi.dart';
import 'package:share/share.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/repositories/verse.repository.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/chapter_details.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/common.action.dart';

List<Middleware<RootState>> createChapterDetailsMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterDetailsReloadInitialStateAction>(_createChapterDetailsReloadInitialState()),
    TypedMiddleware<RootState, ChapterDetailsLoadAction>(_createChapterDetailsLoad()),
    TypedMiddleware<RootState, ChapterDetailsActionChildItemPressedAction>(_createChapterDetailsActionChildItemPressed()),
    TypedMiddleware<RootState, ChapterDetailsSlidableActionTappedAction>(_createChapterDetailsSlidableActionTapped())
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

      final chapterDetailsVerseItems = await Container().resolve<VerseRepository>().findAllByChapterId(
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
   
      if (castedAction.chapterDetailsActionChildItemType == ActionChildItemType.ChangeFontSize)
        store.dispatch(SettingsSharedPreferencesPersistAction(
          settingsThemeFontSize: castedAction.chapterDetailsValue as double
        ));
    } catch(exception) { }
  };
}

Middleware<RootState> _createChapterDetailsSlidableActionTapped() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsSlidableActionTappedAction;
   
      if (castedAction.chapterDetailsSlidableActionType == SlidableActionType.Share) {
        final content = AppLocalizations.of(castedAction.context).translateFormatted(
          'chapter-details-share-verse-item',
          {
            'chapterTitle': castedAction.chapterDetailsChapterItem.title,
            'chapterTranslationText': castedAction.chapterDetailsChapterTranslationItem.text,
            'verseFullText': castedAction.chapterDetailsVerseItem.fullText,
            'verseTranslationText': castedAction.chapterDetailsVerseTranslationItem.text,
            'appShareFootage': AppLocalizations.of(castedAction.context).translate('app-share-footage')
          }
        );

        Share.share(content);
      } else if (castedAction.chapterDetailsSlidableActionType == SlidableActionType.Share)
        store.dispatch(CommonShareAction(
          commonContent: castedAction.chapterDetailsVerseItem.fullText
        ));
    } catch(exception) { }
  };
}
