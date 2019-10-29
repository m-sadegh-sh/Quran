import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shimmer/shimmer.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';
import 'package:quran/items/verse_translation.item.dart';
import 'package:quran/items/verse.item.dart';

class VerseListItemScreen extends StatelessWidget {
  final bool shimmed;
  final int index;
  final ChapterItem chapterItem;
  final ChapterTranslationItem chapterTranslationItem;
  final VerseItem verseItem;
  final VerseTranslationItem verseTranslationItem;
  final GeneratorW4P<ChapterItem, ChapterTranslationItem, VerseItem, VerseTranslationItem, List<IconSlideAction>> verseItemOnGenerateSlidableActions;
  final SlidableController verseItemSlidableController;

  final int settingsTranslatorId;
  
  VerseListItemScreen({
    Key key,
    this.shimmed,
    this.index,
    this.chapterItem,
    this.chapterTranslationItem,
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

  Widget _buildVerseNumber(BuildContext context, bool shimmed) {
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
            children: <Widget>[
              Text(
                shimmed ? '' : verseItem.chapterVerseId.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display4
              )
            ]
          )
        )
      )
    );
  }

  Widget _buildVerseFullText(BuildContext context, bool shimmed) {
    return Text(
      shimmed ? '' : verseItem.fullText,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildVerseTranslationText(BuildContext context, VerseTranslationItem verseTranslationItem, bool shimmed) {
    return Text(
      shimmed ? '' : verseTranslationItem?.text ?? '',
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
            enabled: verseItem.showVerseId,
            controller: verseItemSlidableController,
            delegate: SlidableDrawerDelegate(),
            actionExtentRatio: 0.25,
            actions: verseItemOnGenerateSlidableActions(context, chapterItem, chapterTranslationItem, verseItem, snapshot.data),
            child: Material(
              color: isIndicatable ? Theme.of(context).indicatorColor.withOpacity(0.2) : null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildVerseNumber(context, shimmed),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildVerseFullText(context, shimmed),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: _buildVerseTranslationText(context, snapshot.data, shimmed)
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

        return Material(
          color: isIndicatable ? Theme.of(context).indicatorColor.withOpacity(0.2) : null,
          child: Shimmer.fromColors(
            baseColor: isIndicatable ? Colors.white : Theme.of(context).primaryColorLight.withOpacity(0.5),
            highlightColor: isIndicatable ? Theme.of(context).primaryColorLight.withOpacity(0.5) : Colors.white,
            direction: ShimmerDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildVerseNumber(context, true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Theme.of(context).textTheme.title.color,
                          child: _buildVerseFullText(context, true)
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5.0),
                          color: Theme.of(context).textTheme.display1.color,
                          child: _buildVerseTranslationText(context, null, true),
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        );
      }
    );
  }
}
