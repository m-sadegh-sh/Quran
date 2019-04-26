import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/chapter_details_action.dart';
import 'package:quran/selectors/app_selector.dart';
import 'package:quran/selectors/chapter_details_selector.dart';
import 'package:quran/delegates/generators.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/items/action_item.dart';

class ChapterDetailsViewModel {
  final ChapterItem chapterDetailsChapterItem;
  final GeneratorWNP<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final int chapterDetailsTranslatorId;

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
    this.chapterDetailsTranslatorId
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
      chapterDetailsTranslatorId: appTranslatorIdSelector(appState)
    );
  }
}
