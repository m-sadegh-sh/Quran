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
  final String chapterDetailsBackgroundImage;
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
    this.chapterDetailsBackgroundImage,
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
  
  Widget _buildFlexibleSpace() {
    return FlexibleSpaceBar(              
      centerTitle: true,
      title: Text(
        chapterDetailsItem.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        )
      ),
      background: Image.asset(
        chapterDetailsBackgroundImage,
        fit: BoxFit.cover,
      )
    );
  }

  List<Widget> _buildHeaderSliver(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        actions: _buildActions(context),
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: _buildFlexibleSpace(),
      ),
    ];
  }

  Widget _buildChapterVerses(BuildContext context) {
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
      //appBar: _buildAppBar(context),
      //drawer: _buildDrawer(context),
      //body: _buildChapterVerses(context)
      body: NestedScrollView(
        headerSliverBuilder: _buildHeaderSliver,
        body: _buildChapterVerses(context)
      )
    );
  }
}