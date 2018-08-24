import 'package:Quran/presentation/chapter_list_item.dart';
import 'package:flutter/material.dart';

import 'package:Quran/states/chapter_state.dart';
import 'package:Quran/models/chapter_model.dart';
import 'package:Quran/presentation/list_loading.dart';
import 'package:Quran/presentation/list_load_error.dart';
import 'package:Quran/presentation/list_load_empty.dart';

class ChapterList extends StatelessWidget {
  final ChapterState chapterState;
  final Function(ChapterModel) onItemPressed;

  ChapterList({
    Key key,
    this.chapterState,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chapterState.chapterListLoading)
      return ListLoading();

    if (chapterState.chapterListLoadFailed)
      return ListLoadError(
        error: chapterState.chapterListLoadError
      );

    if (chapterState.chapterList.length == 0)
      return ListLoadEmpty();

    return ListView.builder(
      itemCount: chapterState.chapterList.length,
      itemBuilder: (BuildContext context, int index) => ChapterListItem(
        chapterItem: chapterState.chapterList[index]
      )
    );
  }
}