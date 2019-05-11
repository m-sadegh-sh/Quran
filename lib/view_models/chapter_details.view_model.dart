import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/selectors/chapter_details.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/items/verse_translation.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';

class ChapterDetailsViewModel {
  final ChapterItem chapterDetailsChapterItem;
  final ChapterTranslationItem chapterDetailsChapterTranslationItem;
  final GeneratorW1P<double, List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) chapterDetailsOnActionChildItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final GeneratorW4P<ChapterItem, ChapterTranslationItem, VerseItem, VerseTranslationItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActions;
  final SlidableController chapterDetailsSlidableController;
  final Function(BuildContext, Store<RootState>) chapterDetailsOnSlidableActionTapped;
  final int settingsTranslatorId;
  final double settingsThemeFontSize;

  ChapterDetailsViewModel({
    this.chapterDetailsChapterItem,
    this.chapterDetailsChapterTranslationItem,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsOnActionChildItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsOnGenerateSlidableActions,
    this.chapterDetailsSlidableController,
    this.chapterDetailsOnSlidableActionTapped,
    this.settingsTranslatorId,
    this.settingsThemeFontSize
  });

  static ChapterDetailsViewModel fromStore(Store<RootState> store) {
    final chapterDetailsState = chapterDetailsStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return ChapterDetailsViewModel(
      chapterDetailsChapterItem: chapterDetailsChapterItemSelector(chapterDetailsState),
      chapterDetailsChapterTranslationItem: chapterDetailsChapterTranslationItemSelector(chapterDetailsState),
      chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItemsSelector(chapterDetailsState),
      chapterDetailsOnActionItemPressed: (BuildContext context, ActionItem actionItem) {
        store.dispatch(ChapterDetailsActionItemPressedAction(
          context: context,
          chapterDetailsOnGenerateChild: actionItem.onGenerateChild,
        ));
      },
      chapterDetailsOnActionChildItemPressed: (BuildContext context, ActionChildItem actionChildItem) {
        store.dispatch(ChapterDetailsActionChildItemPressedAction(
          context: context,
          chapterDetailsOnGenerateChild: actionChildItem.onGenerateChild,
          chapterDetailsActionChildItemType: actionChildItem.actionChildItemType,
          chapterDetailsValue: actionChildItem.value
        ));
      },
      chapterDetailsLoading: chapterDetailsLoadingSelector(chapterDetailsState),
      chapterDetailsLoadSucceeded: chapterDetailsLoadSucceededSelector(chapterDetailsState),
      chapterDetailsVerseItems: chapterDetailsVerseItemsSelector(chapterDetailsState),
      chapterDetailsBackgroundImage: chapterDetailsBackgroundImageSelector(chapterDetailsState),
      chapterDetailsLoadFailed: chapterDetailsLoadFailedSelector(chapterDetailsState),
      chapterDetailsLoadError: chapterDetailsLoadErrorSelector(chapterDetailsState),
      chapterDetailsLoad: (ChapterItem chapterDetailsChapterItem) { 
        store.dispatch(ChapterDetailsLoadAction(
          chapterDetailsChapterItem: chapterDetailsChapterItem
        ));
      },
      chapterDetailsOnGenerateSlidableActions: (BuildContext context, ChapterItem chapterItem, ChapterTranslationItem chapterTranslationItem, VerseItem verseItem, VerseTranslationItem verseTranslationItem) => chapterDetailsOnGenerateSlidableActionsSelector(chapterDetailsState)(context, store, chapterItem, chapterTranslationItem, verseItem, verseTranslationItem),
      chapterDetailsSlidableController: chapterDetailsSlidableControllerSelector(chapterDetailsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
