import 'package:flutter/material.dart';

import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterDetailsLoadAction {
  final int chapterDetailsItemId;

  ChapterDetailsLoadAction({
    this.chapterDetailsItemId
  });
}

class ChapterDetailsLoadSucceededAction {
  final ChapterItem chapterDetailsItem;

  ChapterDetailsLoadSucceededAction({
    this.chapterDetailsItem
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