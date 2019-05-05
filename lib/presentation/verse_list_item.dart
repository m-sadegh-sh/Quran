import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/presentation/inline_bouncing_loading.dart';
import 'package:quran/items/verse_translation_item.dart';
import 'package:quran/items/verse_item.dart';

class VerseListItem extends StatelessWidget {
  final VerseItem verseItem;
  final List<IconSlideAction> verseItemSlidableActions;
  final SlidableController verseItemSlidableController;

  final int settingsTranslatorId;
  
  VerseListItem({
    Key key,
    this.verseItem,
    this.verseItemSlidableActions,
    this.verseItemSlidableController,
    this.settingsTranslatorId
  }) : super(key: key);

  bool get isIndicatable {
    if (verseItem.chapterId == 1)
      return verseItem.chapterVerseId % 2 == 0;

    return verseItem.chapterVerseId % 2 == 1;
  }

  Widget _buildVerseNumber(BuildContext context) {
    return Visibility(
      visible: verseItem.showVerseId,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        constraints: BoxConstraints(
          minWidth: 48.0,
          minHeight: 48.0
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(180.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                verseItem.chapterVerseId.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display4
              )
            ]
          )
        )
      )
    );
  }

  Widget _buildVerseFullText(BuildContext context) {
    return Text(
      verseItem.cleanText,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildVerseTranslationText(BuildContext context, VerseTranslationItem verseTranslationItem) {
    return Text(
      verseTranslationItem.text,
      style: Theme.of(context).textTheme.display1
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: verseItem.translation(settingsTranslatorId),
      builder: (BuildContext context, AsyncSnapshot<VerseTranslationItem> snapshot) {
        if (snapshot.hasData)
          return Slidable(
            controller: verseItemSlidableController,
            delegate: SlidableDrawerDelegate(),
            actionExtentRatio: 0.25,
            actions: verseItemSlidableActions,
            child: Material(
              color: isIndicatable ? Theme.of(context).indicatorColor.withAlpha(35) : null,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildVerseNumber(context),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildVerseFullText(context),
                            _buildVerseTranslationText(context, snapshot.data)
                          ],
                        )
                      )
                    )
                  ],
                )
              )
            )
          );

        return InlineBouncingLoading();
      }
    );
  }
}
