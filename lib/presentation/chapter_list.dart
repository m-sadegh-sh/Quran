import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/presentation/list_loading.dart';
import 'package:Quran/presentation/list_load_error.dart';
import 'package:Quran/presentation/list_load_empty.dart';
import 'package:Quran/presentation/chapter_list_item.dart';

class ChapterList extends StatelessWidget {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function(BuildContext, ChapterItem) chapterListOnItemTapped;

  ChapterList({
    Key key,
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListOnItemTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chapterListLoading)
      return ListLoading();

    if (chapterListLoadFailed)
      return ListLoadError(
        error: chapterListLoadError
      );

    if (chapterListItems.length == 0)
      return ListLoadEmpty();

    return ListView.builder(
      itemCount: chapterListItems.length,
      itemBuilder: (BuildContext context, int index) => ChapterListItem(
        chapterItem: chapterListItems[index],
        chapterListOnItemTapped: chapterListOnItemTapped
      )
    );
  }
}