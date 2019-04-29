import 'package:flutter/material.dart';

import 'package:quran/items/chapter_item.dart';
import 'package:quran/presentation/circular_loading.dart';
import 'package:quran/presentation/action_failure.dart';
import 'package:quran/presentation/empty_content.dart';
import 'package:quran/presentation/chapter_list_item.dart';

class ChapterList extends StatelessWidget {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterListItems;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function chapterListLoad;
  final Function(BuildContext, ChapterItem) chapterListOnChapterItemTapped;
  final double settingsThemeFontSize;
  final Function(double) chapterListOnThemeFontSizeChanging;
  final int settingsTranslatorId;

  ChapterList({
    Key key,
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.chapterListLoad,
    this.chapterListOnChapterItemTapped,
    this.settingsThemeFontSize,
    this.chapterListOnThemeFontSizeChanging,
    this.settingsTranslatorId
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

    return GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
        double newSettingsThemeFontSize = settingsThemeFontSize * scaleDetails.scale * 0.8;

        if (newSettingsThemeFontSize > 24.0)
          newSettingsThemeFontSize = 24.0;
        else if (newSettingsThemeFontSize < 16.0)
          newSettingsThemeFontSize = 16.0;

        chapterListOnThemeFontSizeChanging(
          newSettingsThemeFontSize
        );
      },
      child: ListView.builder(
        itemCount: chapterListItems.length,
        itemBuilder: (BuildContext context, int index) => ChapterListItem(
          chapterItem: chapterListItems[index],
          onChapterItemTapped: chapterListOnChapterItemTapped,
          settingsTranslatorId: settingsTranslatorId
        )
      )
    );
  }
}