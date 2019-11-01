import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse_translation.item.dart';
import 'package:quran/items/verse.item.dart';

class VerseListItemScreen extends StatelessWidget {
  final int index;
  final ChapterItem chapterItem;
  final VerseItem verseItem;
  final VerseTranslationItem verseTranslationItem;
  final GeneratorW2P<ChapterItem, VerseItem, List<IconSlideAction>> verseItemOnGenerateSlidableActions;
  final SlidableController verseItemSlidableController;
  final int settingsTranslatorId;
  
  VerseListItemScreen({
    Key key,
    this.index,
    this.chapterItem,
    this.verseItem,
    this.verseTranslationItem,
    this.verseItemOnGenerateSlidableActions,
    this.verseItemSlidableController,
    this.settingsTranslatorId
  }) : super(key: key);

  bool get isIndicatable {
    if (verseItem.chapterId == 1)
      return index % 2 == 0;

    return index % 2 == 1;
  }

  Widget _buildVerseNumber(BuildContext context) {
    return Visibility(
      visible: verseItem.showVerseId,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
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
            children: [
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
      verseItem.fullText,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildVerseTranslatedText(BuildContext context, VerseItem verseItem) {
    return Text(
      verseItem.translatedText ?? '',
      style: Theme.of(context).textTheme.display1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: verseItem.showVerseId,
      controller: verseItemSlidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: verseItemOnGenerateSlidableActions(context, chapterItem, verseItem),
      child: Material(
        color: isIndicatable ? Theme.of(context).indicatorColor.withOpacity(0.2) : null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVerseNumber(context),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildVerseFullText(context),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: _buildVerseTranslatedText(context, verseItem)
                      )
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}
