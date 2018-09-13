import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/presentation/circular_loading.dart';
import 'package:Quran/presentation/action_failure.dart';
import 'package:Quran/presentation/empty_content.dart';
import 'package:Quran/presentation/chapter_list_item.dart';

class ChapterList extends StatelessWidget {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function chapterListLoad;
  final Function(BuildContext, int) chapterListOnChapterItemTapped;

  ChapterList({
    Key key,
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListLoad,
    this.chapterListOnChapterItemTapped
  }) : super(key: key) {
    if (!chapterListLoading && chapterListItems.length == 0 && !chapterListLoadFailed)
      chapterListLoad();
  }

  @override
  Widget build(BuildContext context) {
    if (chapterListLoading)
      return CircularLoading();

    if (chapterListLoadFailed)
      return ActionFailure(
        errorMessage: chapterListLoadError,
        onRetryActionPressed: chapterListLoad,
      );

    if (chapterListItems.length == 0)
      return EmptyContent();

    return ListView.builder(
      itemCount: chapterListItems.length,
      itemBuilder: (BuildContext context, int index) => ChapterListItem(
        chapterItem: chapterListItems[index],
        onChapterItemTapped: chapterListOnChapterItemTapped
      )
    );
  }
}