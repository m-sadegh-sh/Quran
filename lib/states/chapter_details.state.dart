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
  final GeneratorW4P<ChapterItem, bool, double, int, List<ActionItem>> chapterDetailsOnGenerateActionItems;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final bool chapterDetailsIsSearching;
  final GeneratorWNP<String> chapterDetailsOnGenerateSearchHintText;
  final String chapterDetailsSearchQuery;
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
    this.chapterDetailsIsSearching,
    this.chapterDetailsOnGenerateSearchHintText,
    this.chapterDetailsSearchQuery,
    this.chapterDetailsOnGenerateSlidableActions,
    this.chapterDetailsSlidableController
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsChapterItem: null,
    chapterDetailsOnGenerateActionItems: (BuildContext context, ChapterItem chapterDetailsChapterItem, bool chapterDetailsIsSearching, double settingsThemeFontSize, int settingsTranslatorId) => [
      ActionItem(
        onDispatchAction: (BuildContext context, Store<RootState> store) =>
          store.dispatch(
            chapterDetailsIsSearching ? ChapterDetailsSearchCloseAction(
              chapterDetailsChapterItem: chapterDetailsChapterItem,
              settingsTranslatorId: settingsTranslatorId
            ) : ChapterDetailsSearchOpenAction()
          ),
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-search'),
        icon: chapterDetailsIsSearching ? Icons.close : Icons.search
      ),
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('chapter-details-action-more'),
        icon: Icons.more_vert,
        children: [
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
            value: settingsThemeFontSize - 2.0,
            text: AppLocalizations.of(context).translate('chapter-details-action-decrease-font-size'),
            icon: Icons.exposure_neg_1,
            enabled: settingsThemeFontSize > 16.0
          ),
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
            value: settingsThemeFontSize + 2.0,
            text: AppLocalizations.of(context).translate('chapter-details-action-increase-font-size'),
            icon: Icons.exposure_plus_1,
            enabled: settingsThemeFontSize < 24.0
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
    chapterDetailsIsSearching: false,
    chapterDetailsOnGenerateSearchHintText: (BuildContext context) => AppLocalizations.of(context).translate('chapter-details-search-hint-text'),
    chapterDetailsSearchQuery: null,
    chapterDetailsOnGenerateSlidableActions: (BuildContext context, Store<RootState> store, ChapterItem chapterItem, VerseItem verseItem) => [
      new IconSlideAction(
        caption: AppLocalizations.of(context).translate('chapter-details-slidable-action-share-it'),
        color: Theme.of(context).primaryColorDark,
        icon: Icons.share,
        onTap: () => store.dispatch(ChapterDetailsSlidableActionTappedAction(
          context: context,
          chapterDetailsChapterItem: chapterItem,
          chapterDetailsVerseItem: verseItem,
          chapterDetailsSlidableActionType: SlidableActionType.ShareIt
        ))
      ),
      /*new IconSlideAction(
        caption: AppLocalizations.of(context).translate('chapter-details-slidable-action-bookmark-it'),
        color: Theme.of(context).primaryColor,
        icon: Icons.bookmark,
        onTap: () => store.dispatch(ChapterDetailsSlidableActionTappedAction(
          context: context,
          chapterDetailsVerseItem: verseItem,
          chapterDetailsSlidableActionType: SlidableActionType.BookmarkIt
        ))
      ),
      new IconSlideAction(
        caption: AppLocalizations.of(context).translate('chapter-details-slidable-action-undo-bookmark'),
        color: Theme.of(context).primaryColor,
        icon: Icons.bookmark,
        onTap: () => store.dispatch(ChapterDetailsSlidableActionTappedAction(
          context: context,
          chapterDetailsVerseItem: verseItem,
          chapterDetailsSlidableActionType: SlidableActionType.UndoBookmark
        ))
      )*/
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
    chapterDetailsIsSearching,
    chapterDetailsOnGenerateSearchHintText,
    chapterDetailsSearchQuery,
    chapterDetailsSearchResetQuery,
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
    chapterDetailsIsSearching: chapterDetailsIsSearching ?? this.chapterDetailsIsSearching,
    chapterDetailsOnGenerateSearchHintText: chapterDetailsOnGenerateSearchHintText ?? this.chapterDetailsOnGenerateSearchHintText,
    chapterDetailsSearchQuery: chapterDetailsSearchResetQuery ?? false ? null : chapterDetailsSearchQuery ?? this.chapterDetailsSearchQuery,
    chapterDetailsOnGenerateSlidableActions: chapterDetailsOnGenerateSlidableActions ?? this.chapterDetailsOnGenerateSlidableActions,
    chapterDetailsSlidableController: chapterDetailsSlidableController ?? this.chapterDetailsSlidableController
  );
}
