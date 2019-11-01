import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/states/root.state.dart';

class ChapterDetailsLoadAction {
  final BuildContext context;
  final ChapterItem chapterDetailsChapterItem;
  final String chapterDetailsSearchQuery;
  final bool chapterDetailsNavigateToContainer;
  final int settingsTranslatorId;

  ChapterDetailsLoadAction({
    this.context,
    this.chapterDetailsChapterItem,
    this.chapterDetailsSearchQuery,
    this.chapterDetailsNavigateToContainer,
    this.settingsTranslatorId
  });
}

class ChapterDetailsLoadSucceededAction {
  final BuildContext context;
  final List<VerseItem> chapterDetailsVerseItems;
  final bool chapterDetailsNavigateToContainer;

  ChapterDetailsLoadSucceededAction({
    this.context,
    this.chapterDetailsVerseItems,
    this.chapterDetailsNavigateToContainer
  });
}

class ChapterDetailsLoadFailedAction {
  final String chapterDetailsLoadError;

  ChapterDetailsLoadFailedAction({
    this.chapterDetailsLoadError
  });
}

class ChapterDetailsSearchOpenAction { }

class ChapterDetailsSearchCloseAction {
  final ChapterItem chapterDetailsChapterItem;
  final int settingsTranslatorId;

  ChapterDetailsSearchCloseAction({
    this.chapterDetailsChapterItem,
    this.settingsTranslatorId
  });
}

class ChapterDetailsSearchQueryChangingAction {
  final BuildContext context;
  final ChapterItem chapterDetailsChapterItem;
  final String chapterDetailsSearchChangingQuery;
  final int settingsTranslatorId;

  ChapterDetailsSearchQueryChangingAction({
    this.context,
    this.chapterDetailsChapterItem,
    this.chapterDetailsSearchChangingQuery,
    this.settingsTranslatorId
  });
}

class ChapterDetailsSearchQueryChangeSucceededAction {
  final String chapterDetailsSearchChangedQuery;

  ChapterDetailsSearchQueryChangeSucceededAction({
    this.chapterDetailsSearchChangedQuery
  });
}

class ChapterDetailsActionItemPressedAction {
  final BuildContext context;
  final Store<RootState> store;
  final ActionItem chapterDetailsActionItem;

  ChapterDetailsActionItemPressedAction({
    this.context,
    this.store,
    this.chapterDetailsActionItem
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
  final ChapterItem chapterDetailsChapterItem;
  final VerseItem chapterDetailsVerseItem;
  final SlidableActionType chapterDetailsSlidableActionType;

  ChapterDetailsSlidableActionTappedAction({
    this.context,
    this.chapterDetailsChapterItem,
    this.chapterDetailsVerseItem,
    this.chapterDetailsSlidableActionType
  });
}
