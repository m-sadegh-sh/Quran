import 'package:flutter/material.dart';

import 'package:quran/items/action_item.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/presentation/verse_list.dart';

class ChapterDetails extends StatelessWidget {
  final ChapterItem chapterDetailsChapterItem;
  final List<ActionItem> chapterDetailsActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final Function(BuildContext, int) chapterDetailsOnVerseItemTapped;
  final int settingsTranslatorId;

  ChapterDetails({
    Key key,
    this.chapterDetailsChapterItem,
    this.chapterDetailsActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsOnVerseItemTapped,
    this.settingsTranslatorId
  }) : super(key: key);

  List<IconButton> _buildActions(BuildContext context) {
    return chapterDetailsActionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        tooltip: item.tooltip,
        onPressed: () => chapterDetailsOnActionItemPressed(context, item)
      )).toList();
  }
  
  Widget _buildFlexibleSpaceTitle(BuildContext context) {
    return SizedBox(
      height: kTextTabBarHeight,
      child: Text(
        chapterDetailsChapterItem.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.overline
      )
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.all(0),
      centerTitle: true,
      title: _buildFlexibleSpaceTitle(context),
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
        pinned: true,
        flexibleSpace: _buildFlexibleSpace(context)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeaderSliver,
        body: VerseList(
          verseListLoading: chapterDetailsLoading,
          verseListLoadSucceeded: chapterDetailsLoadSucceeded,
          verseListItems: chapterDetailsVerseItems,
          verseListLoadFailed: chapterDetailsLoadFailed,
          verseListLoadError: chapterDetailsLoadError,
          verseListLoad: () => chapterDetailsLoad(chapterDetailsChapterItem),
          verseListOnVerseItemTapped: chapterDetailsOnVerseItemTapped,
          settingsTranslatorId: settingsTranslatorId
        )
      )
    );
  }
}