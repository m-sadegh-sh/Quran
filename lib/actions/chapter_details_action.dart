import 'package:Quran/items/verse_item.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterDetailsLoadAction {
  final int chapterDetailsChapterItemId;

  ChapterDetailsLoadAction({
    this.chapterDetailsChapterItemId
  });
}

class ChapterDetailsLoadSucceededAction {
  final ChapterItem chapterDetailsChapterItem;
  final List<VerseItem> chapterDetailsVerseItems;

  ChapterDetailsLoadSucceededAction({
    this.chapterDetailsChapterItem,
    this.chapterDetailsVerseItems
  });
}

class ChapterDetailsLoadFailedAction {
  final String chapterDetailsLoadError;

  ChapterDetailsLoadFailedAction({
    this.chapterDetailsLoadError
  });
}

class ChapterDetailsActionItemPressedAction {
  final BuildContext context;
  final ActionItem chapterDetailsActionItem;

  ChapterDetailsActionItemPressedAction({
    this.context,
    this.chapterDetailsActionItem
  });
}