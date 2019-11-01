import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/screens/action_failure.screen.dart';
import 'package:quran/screens/empty_content.screen.dart';
import 'package:quran/screens/verse_list_item.screen.dart';

class VerseListScreen extends StatelessWidget {
  final bool verseListLoading;
  final bool verseListLoadSucceeded;
  final List<VerseItem> verseListItems;
  final bool verseListLoadFailed;
  final String verseListLoadError;
  final Function(ChapterItem, String, int) verseListLoad;
  final GeneratorW2P<ChapterItem, VerseItem, List<IconSlideAction>> verseListOnGenerateSlidableActions;
  final SlidableController verseListSlidableController;
  final ChapterItem chapterDetailsChapterItem;
  final String chapterDetailsSearchQuery;
  final int settingsTranslatorId;

  VerseListScreen({
    Key key,
    this.verseListLoading,
    this.verseListLoadSucceeded,
    this.verseListItems,
    this.verseListLoadFailed,
    this.verseListLoadError,
    this.verseListLoad,
    this.verseListOnGenerateSlidableActions,
    this.verseListSlidableController,
    this.chapterDetailsChapterItem,
    this.chapterDetailsSearchQuery,
    this.settingsTranslatorId
  }) : super(key: key) {
    if (!verseListLoadSucceeded && !verseListLoadFailed)
      verseListLoad(chapterDetailsChapterItem, chapterDetailsSearchQuery, settingsTranslatorId);
  }

  @override
  Widget build(BuildContext context) {
    if (verseListLoading)
      return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => VerseListItemScreen(
          index: index,
          verseItem: VerseItem(
            showVerseId: true,
            chapterId: chapterDetailsChapterItem.id,
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
      return ActionFailureScreen(
        errorMessage: verseListLoadError,
        onRetryActionPressed: verseListLoad,
      );

    if (verseListItems.length == 0)
      return EmptyContentScreen();

    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: verseListItems.length,
      itemBuilder: (BuildContext context, int index) => VerseListItemScreen(
        index: index,
        chapterItem: chapterDetailsChapterItem,
        verseItem: verseListItems[index],
        verseItemOnGenerateSlidableActions: verseListOnGenerateSlidableActions,
        verseItemSlidableController: verseListSlidableController,
        settingsTranslatorId: settingsTranslatorId
      )
    );
  }
}