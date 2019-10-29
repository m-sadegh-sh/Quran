import 'package:flutter/material.dart';

import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';

class ChapterListLoadAction {
  final String homeSearchQuery;

  ChapterListLoadAction({
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
  final ChapterTranslationItem chapterListTappedTranslationItem;

  ChapterListItemTappedAction({
    this.context,
    this.chapterListTappedItem,
    this.chapterListTappedTranslationItem
  });
}
