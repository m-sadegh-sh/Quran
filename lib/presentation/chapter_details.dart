import 'package:flutter/material.dart';

import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/presentation/list_loading.dart';
import 'package:Quran/presentation/list_load_error.dart';
import 'package:Quran/presentation/list_load_empty.dart';
import 'package:Quran/presentation/chapter_list_item.dart';

class ChapterDetails extends StatelessWidget {
  final int chapterDetailsItemId;
  final List<ActionItem> chapterDetailsActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsItem;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(int) chapterDetailsLoad;

  ChapterDetails({
    Key key,
    this.chapterDetailsItemId,
    this.chapterDetailsActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsItem,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad
  }) : super(key: key);

  List<IconButton> _buildActions(BuildContext context) {
    return chapterDetailsActionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        tooltip: item.tooltip,
        onPressed: () => chapterDetailsOnActionItemPressed(context, item)
      )).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(chapterDetailsItem.title),
      actions: _buildActions(context)
    );
  }

  _buildChapterVerses(BuildContext context) {
    if (chapterDetailsLoading)
      return ListLoading();

    if (chapterDetailsLoadFailed)
      return ListLoadError(
        error: chapterDetailsLoadError
      );

    if (chapterDetailsItem == null)
      return ListLoadEmpty();

    return ChapterListItem(
      chapterItem: chapterDetailsItem
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      //drawer: _buildDrawer(context),
      body: _buildChapterVerses(context)
    );
  }      
}