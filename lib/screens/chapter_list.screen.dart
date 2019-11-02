import 'package:flutter/material.dart';

import 'package:quran/items/chapter.item.dart';
import 'package:quran/screens/action_failure.screen.dart';
import 'package:quran/screens/empty_content.screen.dart';
import 'package:quran/screens/chapter_list_item.screen.dart';

class ChapterListScreen extends StatelessWidget {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function(String, int) chapterListLoad;
  final Function(BuildContext, ChapterItem, int) chapterListOnChapterItemTapped;
  final String homeSearchQuery;
  final double settingsThemeFontSize;
  final int settingsTranslatorId;

  ChapterListScreen({
    Key key,
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListLoad,
    this.chapterListOnChapterItemTapped,
    this.homeSearchQuery,
    this.settingsThemeFontSize,
    this.settingsTranslatorId
  }) : super(key: key) {
    if (!chapterListLoadSucceeded && !chapterListLoadFailed)
      chapterListLoad(homeSearchQuery, settingsTranslatorId);
  }

  @override
  Widget build(BuildContext context) {
    if (chapterListLoading)
      return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => ChapterListItemScreen(
          index: index,
          chapterItem: ChapterItem(
            id: index + 1,
            fullTitle: ''
          ),
          onChapterItemTapped: chapterListOnChapterItemTapped,
          settingsTranslatorId: settingsTranslatorId
        )
      );

    if (chapterListLoadFailed)
      return ActionFailureScreen(
        errorMessage: chapterListLoadError,
        onRetryActionPressed: () => chapterListLoad(homeSearchQuery, settingsTranslatorId),
      );

    if (chapterListItems.length == 0)
      return EmptyContentScreen();

    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: chapterListItems.length,
      itemBuilder: (BuildContext context, int index) => ChapterListItemScreen(
        index: index,
        chapterItem: chapterListItems[index],
        onChapterItemTapped: chapterListOnChapterItemTapped,
        homeSearchQuery: homeSearchQuery,
        settingsTranslatorId: settingsTranslatorId
      )
    );
  }
}