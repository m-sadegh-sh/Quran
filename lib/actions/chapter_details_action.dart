import 'package:flutter/material.dart';

import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/states/chapter_details_state.dart';

class ChapterDetailsReloadInitialStateAction { }

class ChapterDetailsReloadInitialStateSucceededAction {
  final ChapterDetailsState chapterDetailsState;

  ChapterDetailsReloadInitialStateSucceededAction({
    this.chapterDetailsState
  });
}

class ChapterDetailsReloadInitialStateFailedAction { }

class ChapterDetailsLoadAction {
  final ChapterItem chapterDetailsChapterItem;

  ChapterDetailsLoadAction({
    this.chapterDetailsChapterItem
  });
}

class ChapterDetailsLoadSucceededAction {
  final List<VerseItem> chapterDetailsVerseItems;

  ChapterDetailsLoadSucceededAction({
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
  final ActionItem actionItem;

  ChapterDetailsActionItemPressedAction({
    this.context,
    this.actionItem
  });
}

class ChapterDetailsActionChildItemPressedAction {
  final BuildContext context;
  final ActionChildItem actionChildItem;

  ChapterDetailsActionChildItemPressedAction({
    this.context,
    this.actionChildItem
  });
}

class ChapterDetailsSlidableActionTappedAction {
  final BuildContext context;
  final VerseItem verseItem;

  ChapterDetailsSlidableActionTappedAction({
    this.context,
    this.verseItem
  });
}
