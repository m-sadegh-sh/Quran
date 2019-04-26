import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/chapter_list_action.dart';
import 'package:quran/selectors/settings_selector.dart';
import 'package:quran/selectors/chapter_list_selector.dart';
import 'package:quran/items/chapter_item.dart';

class ChapterListViewModel {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function chapterListLoad;
  final Function(BuildContext, ChapterItem) chapterListOnChapterItemTapped;
  final int settingsTranslatorId;

  ChapterListViewModel({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListLoad,
    this.chapterListOnChapterItemTapped,
    this.settingsTranslatorId
  });

  static ChapterListViewModel fromStore(Store<RootState> store) {
    final chapterListState = chapterListStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return ChapterListViewModel(
      chapterListLoading: chapterListLoadingSelector(chapterListState),
      chapterListLoadSucceeded: chapterListLoadSucceededSelector(chapterListState),
      chapterListItems: chapterListItemsSelector(chapterListState),
      chapterListLoadFailed: chapterListLoadFailedSelector(chapterListState),
      chapterListLoadError: chapterListLoadErrorSelector(chapterListState),
      chapterListLoad: () => store.dispatch(ChapterListLoadAction()),
      chapterListOnChapterItemTapped: (BuildContext context, ChapterItem chapterListTappedItem) =>
        store.dispatch(ChapterListItemTappedAction(
          context: context,
          chapterListTappedItem: chapterListTappedItem,
        )),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
