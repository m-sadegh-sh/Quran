import 'package:flutter/material.dart';

import 'package:Quran/items/verse_item.dart';
import 'package:Quran/presentation/circular_loading.dart';
import 'package:Quran/presentation/action_failure.dart';
import 'package:Quran/presentation/empty_content.dart';
import 'package:Quran/presentation/verse_list_item.dart';

class VerseList extends StatelessWidget {
  final bool verseListLoading;
  final bool verseListLoadSucceeded;
  final List<VerseItem> verseListItems;
  final bool verseListLoadFailed;
  final String verseListLoadError;
  final Function verseListLoad;
  final Function(BuildContext, int) verseListOnVerseItemTapped;
  final int verseListCurrentTranslatorId;

  VerseList({
    Key key,
    this.verseListLoading,
    this.verseListLoadSucceeded,
    this.verseListItems,
    this.verseListLoadFailed,
    this.verseListLoadError,
    this.verseListLoad,
    this.verseListOnVerseItemTapped,
    this.verseListCurrentTranslatorId
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
        onVerseItemTapped: verseListOnVerseItemTapped,
        currentTranslatorId: verseListCurrentTranslatorId
      )
    );
  }
}