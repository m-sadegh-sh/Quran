import 'package:quran/items/verse.item.dart';
import 'package:redux/redux.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/repositories/verse.repository.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/common.action.dart';

List<Middleware<RootState>> createChapterDetailsMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterDetailsLoadAction>(_createChapterDetailsLoad()),
    TypedMiddleware<RootState, ChapterDetailsSearchOpenAction>(_createChapterDetailsSearchOpen()),
    TypedMiddleware<RootState, ChapterDetailsSearchCloseAction>(_createChapterDetailsSearchClose()),
    TypedMiddleware<RootState, ChapterDetailsSearchQueryChangingAction>(_createChapterDetailsSearchQueryChanging()),
    TypedMiddleware<RootState, ChapterDetailsActionChildItemPressedAction>(_createChapterDetailsActionChildItemPressed()),
    TypedMiddleware<RootState, ChapterDetailsSlidableActionTappedAction>(_createChapterDetailsSlidableActionTapped())
  ];
}

Middleware<RootState> _createChapterDetailsLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsLoadAction;
      final verseRepository = Container().resolve<VerseRepository>();

      List<VerseItem> verseListItems;

      if (castedAction.chapterDetailsSearchQuery?.isNotEmpty ?? false)
        verseListItems = await verseRepository.searchAllTranslated(
          castedAction.chapterDetailsChapterItem.id,
          castedAction.settingsTranslatorId,
          castedAction.chapterDetailsSearchQuery
        );
      else
        verseListItems = await verseRepository.findAllTranslated(
          castedAction.chapterDetailsChapterItem.id,
          castedAction.settingsTranslatorId
        );

      store.dispatch(ChapterDetailsLoadSucceededAction(
        context: castedAction.context,
        chapterDetailsVerseItems: verseListItems,
        chapterDetailsNavigateToContainer: castedAction.chapterDetailsNavigateToContainer
      ));
    } catch(exception) {
      store.dispatch(ChapterDetailsLoadFailedAction(
        chapterDetailsLoadError: exception?.toString()
      ));
    }
  };
}

Middleware<RootState> _createChapterDetailsSearchOpen() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      next(action);
    } catch(exception) { }
  };
}

Middleware<RootState> _createChapterDetailsSearchClose() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      next(action);

      final castedAction = action as ChapterDetailsSearchCloseAction;
   
      store.dispatch(ChapterDetailsLoadAction(
        chapterDetailsChapterItem: castedAction.chapterDetailsChapterItem,
        chapterDetailsSearchQuery: null,
        settingsTranslatorId: castedAction.settingsTranslatorId
      ));
    } catch(exception) { }
  };
}

Middleware<RootState> _createChapterDetailsSearchQueryChanging() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsSearchQueryChangingAction;
   
      store.dispatch(ChapterDetailsLoadAction(
        chapterDetailsChapterItem: castedAction.chapterDetailsChapterItem,
        chapterDetailsSearchQuery: castedAction.chapterDetailsSearchChangingQuery,
        settingsTranslatorId: castedAction.settingsTranslatorId
      ));

      store.dispatch(ChapterDetailsSearchQueryChangeSucceededAction(
        chapterDetailsSearchChangedQuery: castedAction.chapterDetailsSearchChangingQuery
      ));
    } catch(exception) { }
  };
}

Middleware<RootState> _createChapterDetailsActionChildItemPressed() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterDetailsActionChildItemPressedAction;
   
      if (castedAction.chapterDetailsActionChildItemType == ActionChildItemType.ChangeFontSize)
        store.dispatch(SettingsPersistAction(
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
   
      if (castedAction.chapterDetailsSlidableActionType == SlidableActionType.ShareIt) {
        final content = AppLocalizations.of(castedAction.context).translateFormatted(
          'chapter-details-share-verse-item',
          {
            'chapterFullTitle': castedAction.chapterDetailsChapterItem.fullTitle,
            'chapterTranslatedTitle': castedAction.chapterDetailsChapterItem.translatedTitle,
            'chapterVerseId': castedAction.chapterDetailsVerseItem.chapterVerseId,
            'verseFullText': castedAction.chapterDetailsVerseItem.fullText,
            'verseTranslatedText': castedAction.chapterDetailsVerseItem.translatedText,
            'appShareFootage': AppLocalizations.of(castedAction.context).translate('app-share-footage')
          }
        );

        store.dispatch(CommonShareAction(
          commonContent: content
        ));
      } else if (castedAction.chapterDetailsSlidableActionType == SlidableActionType.BookmarkIt) {
        // store.dispatch(CommonShareAction(
        //   commonContent: content
        // ));
      } else if (castedAction.chapterDetailsSlidableActionType == SlidableActionType.UndoBookmark) {
        // store.dispatch(CommonShareAction(
        //   commonContent: content
        // ));
      }
    } catch(exception) { }
  };
}
