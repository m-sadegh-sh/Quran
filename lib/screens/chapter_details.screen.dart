import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/screens/verse_list.screen.dart';

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
  final Function(BuildContext, ChapterItem, int) chapterDetailsLoad;
  final bool chapterDetailsIsSearching;
  final String chapterDetailsSearchHintText;
  final String chapterDetailsSearchQuery;
  final Function(BuildContext, int, String) chapterDetailsOnSearchQueryChanging;
  final GeneratorW2P<ChapterItem, VerseItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActions;
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
    this.chapterDetailsIsSearching,
    this.chapterDetailsSearchHintText,
    this.chapterDetailsSearchQuery,
    this.chapterDetailsOnSearchQueryChanging,
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
                      margin: const EdgeInsets.only(left: 15.0),
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
    if (chapterDetailsIsSearching)
      return SizedBox(
        height: kTextTabBarHeight,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(10.0)
          ),
          margin: const EdgeInsets.only(
            top: 60.0,
            bottom: 60.0
          ),
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: chapterDetailsSearchHintText,
              hintStyle: Theme.of(context).textTheme.headline.apply(
                color: Theme.of(context).textSelectionColor
              ),
            ),
            style: Theme.of(context).textTheme.headline,
            initialValue: chapterDetailsSearchQuery,
            onFieldSubmitted: (String text) => chapterDetailsOnSearchQueryChanging(context, settingsTranslatorId, text),
            textInputAction: TextInputAction.search
          )
        )
      );

    return SizedBox(
      height: kTextTabBarHeight,
      child: Text(
        chapterDetailsChapterItem.fullTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.overline
      )
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.all(0),
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
        body: VerseListScreen(
          chapterItem: chapterDetailsChapterItem,
          verseListLoading: chapterDetailsLoading,
          verseListLoadSucceeded: chapterDetailsLoadSucceeded,
          verseListItems: chapterDetailsVerseItems,
          verseListLoadFailed: chapterDetailsLoadFailed,
          verseListLoadError: chapterDetailsLoadError,
          verseListLoad: () => chapterDetailsLoad(context, chapterDetailsChapterItem, settingsTranslatorId),
          verseListOnGenerateSlidableActions: chapterDetailsOnGenerateSlidableActions,
          verseListSlidableController: chapterDetailsSlidableController,
          settingsTranslatorId: settingsTranslatorId
        )
      )
    );
  }
}