import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generate_with_context.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/containers/share_container.dart';
import 'package:quran/containers/bookmark_container.dart';

class ChapterDetailsState {
  final ChapterItem chapterDetailsChapterItem;
  final GenerateWithContext<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;

  ChapterDetailsState({
    this.chapterDetailsChapterItem,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsChapterItem: null,
    chapterDetailsOnGenerateActionItems: (BuildContext context) => [
      ActionItem(
        routeName: ShareContainer.routeName,
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-share'),
        icon: Icons.share
      ),
      ActionItem(
        routeName: BookmarkContainer.routeName,
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-bookmark'),
        icon: Icons.bookmark
      )
    ],
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsVerseItems: List<VerseItem>.unmodifiable([]),
    chapterDetailsBackgroundImage: 'assets/images/quran_background.png',
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );

  ChapterDetailsState copyWith({
    chapterDetailsChapterItem,
    chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading,
    chapterDetailsLoadSucceeded,
    chapterDetailsVerseItems,
    chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed,
    chapterDetailsLoadError
  }) => ChapterDetailsState(
    chapterDetailsChapterItem: chapterDetailsChapterItem ?? this.chapterDetailsChapterItem,
    chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItems ?? this.chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading: chapterDetailsLoading ?? this.chapterDetailsLoading,
    chapterDetailsLoadSucceeded: chapterDetailsLoadSucceeded ?? this.chapterDetailsLoadSucceeded,
    chapterDetailsVerseItems: chapterDetailsVerseItems ?? this.chapterDetailsVerseItems,
    chapterDetailsBackgroundImage: chapterDetailsBackgroundImage ?? this.chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed: chapterDetailsLoadFailed ?? this.chapterDetailsLoadFailed,
    chapterDetailsLoadError: chapterDetailsLoadError ?? this.chapterDetailsLoadError
  );
}
