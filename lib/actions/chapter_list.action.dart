import 'package:flutter/material.dart';

import 'package:quran/items/chapter.item.dart';

class ChapterListLoadAction {
  final int settingsTranslatorId;
  final String homeSearchQuery;

  ChapterListLoadAction({
    this.settingsTranslatorId,
    this.homeSearchQuery
  });
}

class ChapterListLoadSucceededAction {
  final List<ChapterItem> chapterListItems;

  ChapterListLoadSucceededAction({
    this.chapterListItems
  });
}

class ChapterListLoadFailedAction {
  final String chapterListLoadError;

  ChapterListLoadFailedAction({
    this.chapterListLoadError
  });
}

class ChapterListItemTappedAction {
  final BuildContext context;
  final ChapterItem chapterListTappedItem;
  final int settingsTranslatorId;

  ChapterListItemTappedAction({
    this.context,
    this.chapterListTappedItem,
    this.settingsTranslatorId
  });
}
