import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/chapter_details_action.dart';
import 'package:Quran/selectors/chapter_details_selector.dart';
import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/items/action_item.dart';

class ChapterDetailsViewModel {
  final int chapterDetailsChapterItemId;
  final GenerateWithContext<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsChapterItem;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(int) chapterDetailsLoad;

  ChapterDetailsViewModel({
    this.chapterDetailsChapterItemId,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsChapterItem,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad
  });

  static ChapterDetailsViewModel fromStore(Store<RootState> store) {
    final chapterDetailsState = chapterDetailsStateSelector(store.state);

    return ChapterDetailsViewModel(
      chapterDetailsChapterItemId: chapterDetailsChapterItemIdSelector(chapterDetailsState),
      chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItemsSelector(chapterDetailsState),
      chapterDetailsOnActionItemPressed: (BuildContext context, ActionItem chapterDetailsActionItem) {
        store.dispatch(ChapterDetailsActionItemPressedAction(
          context: context,
          chapterDetailsActionItem: chapterDetailsActionItem,
        ));
      },
      chapterDetailsLoading: chapterDetailsLoadingSelector(chapterDetailsState),
      chapterDetailsLoadSucceeded: chapterDetailsLoadSucceededSelector(chapterDetailsState),
      chapterDetailsChapterItem: chapterDetailsChapterItemSelector(chapterDetailsState),
      chapterDetailsBackgroundImage: chapterDetailsBackgroundImageSelector(chapterDetailsState),
      chapterDetailsLoadFailed: chapterDetailsLoadFailedSelector(chapterDetailsState),
      chapterDetailsLoadError: chapterDetailsLoadErrorSelector(chapterDetailsState),
      chapterDetailsLoad: (int chapterDetailsChapterItemId) {
        store.dispatch(ChapterDetailsLoadAction(
          chapterDetailsChapterItemId: chapterDetailsChapterItemId
        ));
      }
    );
  }
}
