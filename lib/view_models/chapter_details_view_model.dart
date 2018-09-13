import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_details_action.dart';
import 'package:Quran/selectors/app_selector.dart';
import 'package:Quran/selectors/chapter_details_selector.dart';
import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/items/verse_item.dart';
import 'package:Quran/items/action_item.dart';

class ChapterDetailsViewModel {
  final ChapterItem chapterDetailsChapterItem;
  final GenerateWithContext<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final int chapterDetailsCurrentTranslatorId;

  ChapterDetailsViewModel({
    this.chapterDetailsChapterItem,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsCurrentTranslatorId
  });

  static ChapterDetailsViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);
    final chapterDetailsState = chapterDetailsStateSelector(store.state);

    return ChapterDetailsViewModel(
      chapterDetailsChapterItem: chapterDetailsChapterItemSelector(chapterDetailsState),
      chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItemsSelector(chapterDetailsState),
      chapterDetailsOnActionItemPressed: (BuildContext context, ActionItem chapterDetailsActionItem) {
        store.dispatch(ChapterDetailsActionItemPressedAction(
          context: context,
          chapterDetailsActionItem: chapterDetailsActionItem,
        ));
      },
      chapterDetailsLoading: chapterDetailsLoadingSelector(chapterDetailsState),
      chapterDetailsLoadSucceeded: chapterDetailsLoadSucceededSelector(chapterDetailsState),
      chapterDetailsVerseItems: chapterDetailsVerseItemsSelector(chapterDetailsState),
      chapterDetailsBackgroundImage: chapterDetailsBackgroundImageSelector(chapterDetailsState),
      chapterDetailsLoadFailed: chapterDetailsLoadFailedSelector(chapterDetailsState),
      chapterDetailsLoadError: chapterDetailsLoadErrorSelector(chapterDetailsState),
      chapterDetailsLoad: (ChapterItem chapterDetailsChapterItem) => 
        store.dispatch(ChapterDetailsLoadAction(
          chapterDetailsChapterItem: chapterDetailsChapterItem
        )),
      chapterDetailsCurrentTranslatorId: appCurrentTranslatorIdSelector(appState)
    );
  }
}
