import 'package:flutter/material.dart';
import 'package:quran/app_localizations.dart';

import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';
import 'package:quran/presentation/verse_list.dart';

class ChapterDetails extends StatelessWidget {
  final ChapterItem chapterDetailsChapterItem;
  final List<ActionItem> chapterDetailsActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) chapterDetailsOnActionChildItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final VerseItem chapterDetailsSelectedVerseItem;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final Function(VerseItem) chapterDetailsOnVerseItemLongPressed;
  final int settingsTranslatorId;

  ChapterDetails({
    Key key,
    this.chapterDetailsChapterItem,
    this.chapterDetailsActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsOnActionChildItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsSelectedVerseItem,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsOnVerseItemLongPressed,
    this.settingsTranslatorId
  }) : super(key: key);

  List<Widget> _buildActions(BuildContext context) {
    return chapterDetailsActionItems
      .map<Widget>((item) {
        if (item.children == null)
          return IconButton(
            icon: Icon(item.icon),
            tooltip: item.tooltip,
            onPressed: () => chapterDetailsOnActionItemPressed(context, item)
          );

        return PopupMenuButton(
          offset: Offset(0, kToolbarHeight),
          icon: Icon(item.icon),
          tooltip: item.tooltip,
          itemBuilder: (BuildContext context) {
            return item.children.map((ActionChildItem child) {
              return PopupMenuItem<ActionChildItem>(
                enabled: child.enabled,
                value: child,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Icon(child.icon)
                    ),
                    Text(
                      child.text,
                      style: Theme.of(context).textTheme.display3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center
                    )
                  ]
                )
              );
            }).toList();
          },
          onSelected: (ActionChildItem item) => chapterDetailsOnActionChildItemPressed(context, item),
        );
      }).toList();
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    if (chapterDetailsSelectedVerseItem == null)
      return null;

    return BottomNavigationBar(
      unselectedFontSize: 10.0,
      selectedFontSize: 10.0,
      items: [
        new BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.share,
            size: 0.0
          ),          
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Icon(
                Icons.share,
                color: Theme.of(context).textTheme.button.color
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 5.0
                ),
                child: Text(
                  AppLocalizations.of(context).translate('chapter-details-bottom-navigation-share'),
                  style: Theme.of(context).textTheme.button
                )
              )
            ]
          )
        ),
        new BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark,
            size: 0.0
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.bookmark,
                color: Theme.of(context).textTheme.button.color
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 5.0
                ),
                child: Text(
                  AppLocalizations.of(context).translate('chapter-details-bottom-navigation-bookmark'),
                  style: Theme.of(context).textTheme.button
                )
              )
            ]
          )
        )
      ]
    );
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
          verseListOnVerseItemLongPressed: chapterDetailsOnVerseItemLongPressed,
          settingsTranslatorId: settingsTranslatorId
        )
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}