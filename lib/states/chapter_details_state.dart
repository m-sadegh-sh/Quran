import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterDetailsState {
  final int chapterDetailsItemId;
  final GenerateWithContext<List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsItem;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;

  ChapterDetailsState({
    this.chapterDetailsItemId,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsItem,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsItemId: null,
    chapterDetailsOnGenerateActionItems: (BuildContext context) => [
      ActionItem(
        routeName: '/share',
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-share'),
        icon: Icons.share
      )
    ],
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsItem: null,
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );

  ChapterDetailsState copyWith({
    chapterDetailsItemId,
    chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading,
    chapterDetailsLoadSucceeded,
    chapterDetailsItem,
    chapterDetailsLoadFailed,
    chapterDetailsLoadError
  }) => ChapterDetailsState(
    chapterDetailsItemId: chapterDetailsItemId ?? this.chapterDetailsItemId,
    chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItems ?? this.chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading: chapterDetailsLoading ?? this.chapterDetailsLoading,
    chapterDetailsLoadSucceeded: chapterDetailsLoadSucceeded ?? this.chapterDetailsLoadSucceeded,
    chapterDetailsItem: chapterDetailsItem ?? this.chapterDetailsItem,
    chapterDetailsLoadFailed: chapterDetailsLoadFailed ?? this.chapterDetailsLoadFailed,
    chapterDetailsLoadError: chapterDetailsLoadError ?? this.chapterDetailsLoadError
  );
}
