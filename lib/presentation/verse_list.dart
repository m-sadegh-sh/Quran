import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generators.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/presentation/action_failure.dart';
import 'package:quran/presentation/empty_content.dart';
import 'package:quran/presentation/verse_list_item.dart';

class VerseList extends StatelessWidget {
  final ChapterItem chapterItem;
  final bool verseListLoading;
  final bool verseListLoadSucceeded;
  final List<VerseItem> verseListItems;
  final bool verseListLoadFailed;
  final String verseListLoadError;
  final Function verseListLoad;
  final GeneratorW1P<VerseItem, List<IconSlideAction>> verseListOnGenerateSlidableActions;
  final SlidableController verseListSlidableController;
  final int settingsTranslatorId;

  VerseList({
    Key key,
    this.chapterItem,
    this.verseListLoading,
    this.verseListLoadSucceeded,
    this.verseListItems,
    this.verseListLoadFailed,
    this.verseListLoadError,
    this.verseListLoad,
    this.verseListOnGenerateSlidableActions,
    this.verseListSlidableController,
    this.settingsTranslatorId
  }) : super(key: key) {
    if (!verseListLoading && verseListItems.length == 0 && !verseListLoadFailed)
      verseListLoad();
  }

  @override
  Widget build(BuildContext context) {
    if (verseListLoading)
      return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => VerseListItem(
          shimmed: true,
          verseItem: VerseItem(
            showVerseId: true,
            chapterId: chapterItem.id,
            chapterVerseId: index,
            fullText: '',
            cleanText: ''
          ),
          verseItemOnGenerateSlidableActions: verseListOnGenerateSlidableActions,
          verseItemSlidableController: verseListSlidableController,
          settingsTranslatorId: settingsTranslatorId
        )
      );

    if (verseListLoadFailed)
      return ActionFailure(
        errorMessage: verseListLoadError,
        onRetryActionPressed: verseListLoad,
      );

    if (verseListItems.length == 0)
      return EmptyContent();

    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: verseListItems.length,
      itemBuilder: (BuildContext context, int index) => VerseListItem(
        shimmed: false,
        verseItem: verseListItems[index],
        verseItemOnGenerateSlidableActions: verseListOnGenerateSlidableActions,
        verseItemSlidableController: verseListSlidableController,
        settingsTranslatorId: settingsTranslatorId
      )
    );
  }
}