import 'package:flutter/material.dart';

import 'package:quran/items/chapter.item.dart';

class ChapterListLoadAction {
  final int settingTranslatorId;
  final String homeSearchQuery;

  ChapterListLoadAction({
    this.settingTranslatorId,
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

  ChapterListItemTappedAction({
    this.context,
    this.chapterListTappedItem
  });
}
