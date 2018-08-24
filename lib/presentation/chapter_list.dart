import 'package:Quran/presentation/chapter_list_item.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/presentation/list_loading.dart';
import 'package:Quran/presentation/list_load_error.dart';
import 'package:Quran/presentation/list_load_empty.dart';

class ChapterList extends StatelessWidget {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterList;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function(ChapterItem) onChapterItemTapped;

  ChapterList({
    Key key,
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterList,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.onChapterItemTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chapterListLoading)
      return ListLoading();

    if (chapterListLoadFailed)
      return ListLoadError(
        error: chapterListLoadError
      );

    if (chapterList.length == 0)
      return ListLoadEmpty();

    return ListView.builder(
      itemCount: chapterList.length,
      itemBuilder: (BuildContext context, int index) => ChapterListItem(
        chapterItem: chapterList[index],
        onChapterItemTapped: onChapterItemTapped
      )
    );
  }
}