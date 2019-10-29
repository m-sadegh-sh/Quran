import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/items/verse_translation.item.dart';
import 'package:quran/screens/action_failure.screen.dart';
import 'package:quran/screens/empty_content.screen.dart';
import 'package:quran/screens/verse_list_item.screen.dart';

class VerseListScreen extends StatelessWidget {
  final ChapterItem chapterItem;
  final ChapterTranslationItem chapterTranslationItem;
  final bool verseListLoading;
  final bool verseListLoadSucceeded;
  final List<VerseItem> verseListItems;
  final bool verseListLoadFailed;
  final String verseListLoadError;
  final Function verseListLoad;
  final GeneratorW4P<ChapterItem, ChapterTranslationItem, VerseItem, VerseTranslationItem, List<IconSlideAction>> verseListOnGenerateSlidableActions;
  final SlidableController verseListSlidableController;
  final int settingsTranslatorId;

  VerseListScreen({
    Key key,
    this.chapterItem,
    this.chapterTranslationItem,
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
        itemBuilder: (BuildContext context, int index) => VerseListItemScreen(
          shimmed: true,
          index: index,
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
        shimmed: false,
        index: index,
        chapterItem: chapterItem,
        chapterTranslationItem: chapterTranslationItem,
        verseItem: verseListItems[index],
        verseItemOnGenerateSlidableActions: verseListOnGenerateSlidableActions,
        verseItemSlidableController: verseListSlidableController,
        settingsTranslatorId: settingsTranslatorId
      )
    );
  }
}