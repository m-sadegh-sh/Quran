import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/enumerations/slidable_action_type.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';

class ChapterDetailsState {
  final ChapterItem chapterDetailsChapterItem;
  final GeneratorW1P<double, List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final GeneratorW3P<Store<RootState>, ChapterItem, VerseItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActions;
  final SlidableController chapterDetailsSlidableController;

  ChapterDetailsState({
    this.chapterDetailsChapterItem,
    this.chapterDetailsOnGenerateActionItems,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsOnGenerateSlidableActions,
    this.chapterDetailsSlidableController
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsChapterItem: null,
    chapterDetailsOnGenerateActionItems: (BuildContext context, double fontSize) => [
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-search'),
        icon: Icons.search
      ),
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-more'),
        icon: Icons.more_vert,
        children: [
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
            value: fontSize - 2.0,
            text: AppLocalizations.of(context).translate('chapter-details-action-decrease-font-size'),
            icon: Icons.exposure_neg_1,
            enabled: fontSize > 16.0
          ),
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
            value: fontSize + 2.0,
            text: AppLocalizations.of(context).translate('chapter-details-action-increase-font-size'),
            icon: Icons.exposure_plus_1,
            enabled: fontSize < 24.0
          )
        ]
      )
    ],
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsVerseItems: List<VerseItem>.unmodifiable([]),
    chapterDetailsBackgroundImage: 'assets/images/quran_background.png',
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null,
    chapterDetailsOnGenerateSlidableActions: (BuildContext context, Store<RootState> store, ChapterItem chapterItem, VerseItem verseItem) => [
      new IconSlideAction(
        caption: AppLocalizations.of(context).translate('chapter-details-slidable-action-share'),
        color: Theme.of(context).primaryColorDark,
        icon: Icons.share,
        onTap: () => store.dispatch(ChapterDetailsSlidableActionTappedAction(
          context: context,
          chapterDetailsChapterItem: chapterItem,
          chapterDetailsVerseItem: verseItem,
          chapterDetailsSlidableActionType: SlidableActionType.ShareVerse
        ))
      ),
      new IconSlideAction(
        caption: AppLocalizations.of(context).translate('chapter-details-slidable-action-bookmark'),
        color: Theme.of(context).primaryColor,
        icon: Icons.bookmark,
        onTap: () => store.dispatch(ChapterDetailsSlidableActionTappedAction(
          context: context,
          chapterDetailsVerseItem: verseItem,
          chapterDetailsSlidableActionType: SlidableActionType.AddVerseToBookmarks
        ))
      )
    ],
    chapterDetailsSlidableController: new SlidableController()
  );

  ChapterDetailsState copyWith({
    chapterDetailsChapterItem,
    chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading,
    chapterDetailsLoadSucceeded,
    chapterDetailsVerseItems,
    chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed,
    chapterDetailsLoadError,
    chapterDetailsOnGenerateSlidableActions,
    chapterDetailsSlidableController
  }) => ChapterDetailsState(
    chapterDetailsChapterItem: chapterDetailsChapterItem ?? this.chapterDetailsChapterItem,
    chapterDetailsOnGenerateActionItems: chapterDetailsOnGenerateActionItems ?? this.chapterDetailsOnGenerateActionItems,
    chapterDetailsLoading: chapterDetailsLoading ?? this.chapterDetailsLoading,
    chapterDetailsLoadSucceeded: chapterDetailsLoadSucceeded ?? this.chapterDetailsLoadSucceeded,
    chapterDetailsVerseItems: chapterDetailsVerseItems ?? this.chapterDetailsVerseItems,
    chapterDetailsBackgroundImage: chapterDetailsBackgroundImage ?? this.chapterDetailsBackgroundImage,
    chapterDetailsLoadFailed: chapterDetailsLoadFailed ?? this.chapterDetailsLoadFailed,
    chapterDetailsLoadError: chapterDetailsLoadError ?? this.chapterDetailsLoadError,
    chapterDetailsOnGenerateSlidableActions: chapterDetailsOnGenerateSlidableActions ?? this.chapterDetailsOnGenerateSlidableActions,
    chapterDetailsSlidableController: chapterDetailsSlidableController ?? this.chapterDetailsSlidableController
  );
}
