import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/chapter_details_action.dart';
import 'package:quran/selectors/settings_selector.dart';
import 'package:quran/selectors/chapter_details_selector.dart';
import 'package:quran/delegates/generators.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';

class ChapterDetailsViewModel {
  final ChapterItem chapterDetailsChapterItem;
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
  final GeneratorWNP<List<IconSlideAction>> chapterDetailsOnGenerateSlidableActions;
  final SlidableController chapterDetailsSlidableController;
  final int settingsTranslatorId;
  final double settingsThemeFontSize;

  ChapterDetailsViewModel({
    this.chapterDetailsChapterItem,
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
    this.settingsTranslatorId,
    this.settingsThemeFontSize
  });

  static ChapterDetailsViewModel fromStore(Store<RootState> store) {
    final chapterDetailsState = chapterDetailsStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return ChapterDetailsViewModel(
      chapterDetailsChapterItem: chapterDetailsChapterItemSelector(chapterDetailsState),
      chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItemsSelector(chapterDetailsState),
      chapterDetailsOnActionItemPressed: (BuildContext context, ActionItem actionItem) {
        store.dispatch(ChapterDetailsActionItemPressedAction(
          context: context,
          actionItem: actionItem,
        ));
      },
      chapterDetailsOnActionChildItemPressed: (BuildContext context, ActionChildItem actionChildItem) {
        store.dispatch(ChapterDetailsActionChildItemPressedAction(
          context: context,
          actionChildItem: actionChildItem,
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
      chapterDetailsOnGenerateSlidableActions: chapterDetailsOnGenerateSlidableActionsSelector(chapterDetailsState),
      chapterDetailsSlidableController: chapterDetailsSlidableControllerSelector(chapterDetailsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
