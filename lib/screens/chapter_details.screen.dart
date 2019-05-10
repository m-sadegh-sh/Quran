import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/presentation/verse_list.dart';

class ChapterDetailsScreen extends StatelessWidget {
  final ChapterItem chapterDetailsChapterItem;
  final List<ActionItem> chapterDetailsActionItems;
  final Function(BuildContext, ActionItem) chapterDetailsOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) chapterDetailsOnActionChildItemPressed;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final List<VerseItem> chapterDetailsVerseItems;
  final String chapterDetailsBackgroundImage;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;
  final Function(ChapterItem) chapterDetailsLoad;
  final GeneratorW1P<VerseItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActions;
  final SlidableController chapterDetailsSlidableController;
  final int settingsTranslatorId;

  ChapterDetailsScreen({
    Key key,
    this.chapterDetailsChapterItem,
    this.chapterDetailsActionItems,
    this.chapterDetailsOnActionItemPressed,
    this.chapterDetailsOnActionChildItemPressed,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsVerseItems,
    this.chapterDetailsBackgroundImage,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError,
    this.chapterDetailsLoad,
    this.chapterDetailsOnGenerateSlidableActions,
    this.chapterDetailsSlidableController,
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
                      margin: EdgeInsets.only(left: 15.0),
                      child: Icon(
                        child.icon,
                        color: Theme.of(context).textTheme.display3.color.withOpacity(0.45)
                      )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _buildHeaderSliver,
        body: VerseList(
          chapterItem: chapterDetailsChapterItem,
          verseListLoading: chapterDetailsLoading,
          verseListLoadSucceeded: chapterDetailsLoadSucceeded,
          verseListItems: chapterDetailsVerseItems,
          verseListLoadFailed: chapterDetailsLoadFailed,
          verseListLoadError: chapterDetailsLoadError,
          verseListLoad: () => chapterDetailsLoad(chapterDetailsChapterItem),
          verseListOnGenerateSlidableActions: chapterDetailsOnGenerateSlidableActions,
          verseListSlidableController: chapterDetailsSlidableController,
          settingsTranslatorId: settingsTranslatorId
        )
      )
    );
  }
}