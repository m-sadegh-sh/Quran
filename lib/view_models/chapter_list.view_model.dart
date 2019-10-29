import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/home.selector.dart';
import 'package:quran/actions/chapter_list.action.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/selectors/chapter_list.selector.dart';
import 'package:quran/items/chapter.item.dart';

class ChapterListViewModel {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function(int, String) chapterListLoad;
  final Function(BuildContext, ChapterItem) chapterListOnChapterItemTapped;
  final String homeSearchQuery;
  final double settingsThemeFontSize;
  final Function(double) chapterListOnThemeFontSizeChanging;
  final int settingsTranslatorId;

  ChapterListViewModel({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListLoad,
    this.chapterListOnChapterItemTapped,
    this.homeSearchQuery,
    this.settingsThemeFontSize,
    this.chapterListOnThemeFontSizeChanging,
    this.settingsTranslatorId
  });

  static ChapterListViewModel fromStore(Store<RootState> store) {
    final chapterListState = chapterListStateSelector(store.state);
    final homeState = homeStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return ChapterListViewModel(
      chapterListLoading: chapterListLoadingSelector(chapterListState),
      chapterListLoadSucceeded: chapterListLoadSucceededSelector(chapterListState),
      chapterListItems: chapterListItemsSelector(chapterListState),
      chapterListLoadFailed: chapterListLoadFailedSelector(chapterListState),
      chapterListLoadError: chapterListLoadErrorSelector(chapterListState),
      chapterListLoad: (int settingTranslatorId, String homeSearchQuery) => 
        store.dispatch(ChapterListLoadAction(
          settingTranslatorId: settingTranslatorId,
          homeSearchQuery: homeSearchQuery
        )
      ),
      chapterListOnChapterItemTapped: (BuildContext context, ChapterItem chapterListTappedItem) =>
        store.dispatch(ChapterListItemTappedAction(
          context: context,
          chapterListTappedItem: chapterListTappedItem
        )
      ),
      homeSearchQuery: homeSearchQuerySelector(homeState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      chapterListOnThemeFontSizeChanging: (newSettingsThemeFontSize) =>
        store.dispatch(SettingsSharedPreferencesPersistAction(
          settingsThemeFontSize: newSettingsThemeFontSize
        )),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
