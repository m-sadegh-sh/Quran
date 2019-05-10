import 'package:flutter/material.dart';

import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/states/chapter_details.state.dart';

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
  final GeneratorWNP<Widget> chapterDetailsOnGenerateChild;

  ChapterDetailsActionItemPressedAction({
    this.context,
    this.chapterDetailsOnGenerateChild
  });
}

class ChapterDetailsActionChildItemPressedAction {
  final BuildContext context;
  final GeneratorWNP<Widget> chapterDetailsOnGenerateChild;
  final ActionChildItemType chapterDetailsActionChildItemType;
  final Object chapterDetailsValue;

  ChapterDetailsActionChildItemPressedAction({
    this.context,
    this.chapterDetailsOnGenerateChild,
    this.chapterDetailsActionChildItemType,
    this.chapterDetailsValue
  });
}

class ChapterDetailsSlidableActionTappedAction {
  final BuildContext context;
  final VerseItem chapterDetailsVerseItem;
  final SlidableActionType chapterDetailsSlidableActionType;

  ChapterDetailsSlidableActionTappedAction({
    this.context,
    this.chapterDetailsVerseItem,
    this.chapterDetailsSlidableActionType
  });
}
