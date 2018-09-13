import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterDetailsState {
  final int chapterDetailsChapterItemId;
  final GenerateWithContext<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsChapterItem;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;

  ChapterDetailsState({
    this.chapterDetailsChapterItemId,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsChapterItem,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsChapterItemId: null,
    chapterDetailsOnGenerateActionItems: (BuildContext context) => [
      ActionItem(
        routeName: '/share',
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-share'),
        icon: Icons.share
      )
    ],
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsChapterItem: null,
    chapterDetailsBackgroundImage: 'assets/images/flexible_space_bar_background.png',
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );

  ChapterDetailsState copyWith({
    chapterDetailsChapterItemId,
    chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading,
    chapterDetailsLoadSucceeded,
    chapterDetailsChapterItem,
    chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed,
    chapterDetailsLoadError
  }) => ChapterDetailsState(
    chapterDetailsChapterItemId: chapterDetailsChapterItemId ?? this.chapterDetailsChapterItemId,
    chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItems ?? this.chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading: chapterDetailsLoading ?? this.chapterDetailsLoading,
    chapterDetailsLoadSucceeded: chapterDetailsLoadSucceeded ?? this.chapterDetailsLoadSucceeded,
    chapterDetailsChapterItem: chapterDetailsChapterItem ?? this.chapterDetailsChapterItem,
    chapterDetailsBackgroundImage: chapterDetailsBackgroundImage ?? this.chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed: chapterDetailsLoadFailed ?? this.chapterDetailsLoadFailed,
    chapterDetailsLoadError: chapterDetailsLoadError ?? this.chapterDetailsLoadError
  );
}
