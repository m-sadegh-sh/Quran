import 'package:Quran/app_localizations.dart';
import 'package:Quran/presentation/verse_list.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/items/verse_item.dart';

class ChapterDetails extends StatelessWidget {
  final int chapterDetailsChapterItemId;
  final List<ActionItem> chapterDetailsActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsChapterItem;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(int) chapterDetailsLoad;
  final Function(BuildContext, int) chapterDetailsOnVerseItemTapped;

  ChapterDetails({
    Key key,
    this.chapterDetailsChapterItemId,
    this.chapterDetailsActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsChapterItem,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsOnVerseItemTapped
  }) : super(key: key);

  List<IconButton> _buildActions(BuildContext context) {
    if (chapterDetailsChapterItem == null)
      return null;

    return chapterDetailsActionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        tooltip: item.tooltip,
        onPressed: () => chapterDetailsOnActionItemPressed(context, item)
      )).toList();
  }
  
  Widget _buildFlexibleSpaceTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0
      ),
      child: Text(
        chapterDetailsChapterItem?.title ?? AppLocalizations.of(context).translate('chapter-details-title'),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        )
      )
    );
  }

  Widget _buildFlexibleSpaceSubtitle(BuildContext context) {
    if (chapterDetailsChapterItem == null)
      return Text('');

    var description = AppLocalizations.of(context).translateFormatted(
      'chapter-details-sub-title',
      {
        'classification': AppLocalizations.of(context).translateEnum(chapterDetailsChapterItem.classification),
        'versesCount': chapterDetailsChapterItem.versesCount,
        'order': chapterDetailsChapterItem.order,
        'partNumber': chapterDetailsChapterItem.partNumber
      }
    );

    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 12.0
      )
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildFlexibleSpaceTitle(context),
            _buildFlexibleSpaceSubtitle(context)
          ]
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
        flexibleSpace: _buildFlexibleSpace(context),
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
          verseListLoad: chapterDetailsLoad,
          verseListOnVerseItemTapped: chapterDetailsOnVerseItemTapped
        )
      )
    );
  }
}