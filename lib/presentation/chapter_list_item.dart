import 'package:Quran/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';
import 'package:Quran/items/chapter_translation_item.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterItem chapterItem;
  final Function(BuildContext, int) onChapterItemTapped;
  final int currentTranslatorId;

  ChapterListItem({
    Key key,
    this.chapterItem,
    this.onChapterItemTapped,
    this.currentTranslatorId
  }) : super(key: key);

  Widget _buildChapterNumber(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: 48.0,
        height: 48.0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(180.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                chapterItem.id.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColorDark
                )              
              )
            ]
          )
        )
      )
    );
  }

  Widget _buildChapterTitle(BuildContext context) {
    return Container(
      child: Text(
        chapterItem.title,
        style: Theme.of(context).textTheme.title.apply(
          fontWeightDelta: -2
        )
      )
    );
  }

  Widget _buildChapterTranslationText(BuildContext context) {
    return FutureBuilder(
      future: chapterItem.translation(currentTranslatorId),
      builder: (BuildContext context, AsyncSnapshot<ChapterTranslationItem> snapshot) =>
        Container(
          child: Text(
            snapshot.hasData ? snapshot.data.text : AppLocalizations.of(context).translate('chapter-item-translation-text'),
            style: Theme.of(context).textTheme.caption.apply(
              fontWeightDelta: -1
            )
          )
        )
    );
  }

  Widget _buildChapterOrder(BuildContext context) {
    var order = AppLocalizations.of(context).translateFormatted(
      'chapter-item-order',
      {
        'order': chapterItem.order
      }
    );

    return Text(
      order,
      style: Theme.of(context).textTheme.caption.apply(
        fontWeightDelta: -2
      )
    );
  }

  Widget _buildChapterPartNumber(BuildContext context) {
    var partNumber = AppLocalizations.of(context).translateFormatted(
      'chapter-item-part-number',
      {
        'partNumber': chapterItem.partNumber
      }
    );

    return Text(
      partNumber,
      style: Theme.of(context).textTheme.caption.apply(
        fontWeightDelta: -2
      )
    );
  }

  Widget _buildChapterClassificationAndVersesCount(BuildContext context) {
    var classificationAndVersesCount = AppLocalizations.of(context).translateFormatted(
      'chapter-item-classification-and-verses-count',
      {
        'classification': AppLocalizations.of(context).translateEnum(chapterItem.classification),
        'versesCount': chapterItem.versesCount
      }
    );

    return Text(
      classificationAndVersesCount,
      style: Theme.of(context).textTheme.caption.apply(
        fontWeightDelta: -2
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: chapterItem.id % 2 == 0 ? Theme.of(context).indicatorColor.withAlpha(35) : null,
      child: InkWell(
        onTap: () => onChapterItemTapped(context, chapterItem.id),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              _buildChapterNumber(context),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildChapterTitle(context),
                      _buildChapterTranslationText(context)
                    ],
                  )
                )
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildChapterPartNumber(context),
                    _buildChapterOrder(context),
                    _buildChapterClassificationAndVersesCount(context)
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}
