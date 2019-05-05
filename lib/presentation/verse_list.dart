import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/items/verse_item.dart';
import 'package:quran/presentation/circular_loading.dart';
import 'package:quran/presentation/action_failure.dart';
import 'package:quran/presentation/empty_content.dart';
import 'package:quran/presentation/verse_list_item.dart';

class VerseList extends StatelessWidget {
  final bool verseListLoading;
  final bool verseListLoadSucceeded;
  final List<VerseItem> verseListItems;
  final bool verseListLoadFailed;
  final String verseListLoadError;
  final Function verseListLoad;
  final List<IconSlideAction> verseListSlidableActions;
  final SlidableController verseListSlidableController;
  final int settingsTranslatorId;

  VerseList({
    Key key,
    this.verseListLoading,
    this.verseListLoadSucceeded,
    this.verseListItems,
    this.verseListLoadFailed,
    this.verseListLoadError,
    this.verseListLoad,
    this.verseListSlidableActions,
    this.verseListSlidableController,
    this.settingsTranslatorId
  }) : super(key: key) {
    if (!verseListLoading && verseListItems.length == 0 && !verseListLoadFailed)
      verseListLoad();
  }

  @override
  Widget build(BuildContext context) {
    if (verseListLoading)
      return CircularLoading();

    if (verseListLoadFailed)
      return ActionFailure(
        errorMessage: verseListLoadError,
        onRetryActionPressed: verseListLoad,
      );

    if (verseListItems.length == 0)
      return EmptyContent();

    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: verseListItems.length,
      itemBuilder: (BuildContext context, int index) => VerseListItem(
        verseItem: verseListItems[index],
        verseItemSlidableActions: verseListSlidableActions,
        verseItemSlidableController: verseListSlidableController,
        settingsTranslatorId: settingsTranslatorId
      )
    );
  }
}