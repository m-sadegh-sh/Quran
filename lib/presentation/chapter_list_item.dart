import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/presentation/inline_bouncing_loading.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/chapter_translation_item.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterItem chapterItem;
  final Function(BuildContext, ChapterItem) onChapterItemTapped;
  final int settingsTranslatorId;

  ChapterListItem({
    Key key,
    this.chapterItem,
    this.onChapterItemTapped,
    this.settingsTranslatorId
  }) : super(key: key);

  Widget _buildChapterNumber(BuildContext context) {
    return Container(
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
              chapterItem.id.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display4
            )
          ]
        )
      )
    );
  }

  Widget _buildChapterTitle(BuildContext context) {
    return Text(
      chapterItem.title,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildChapterTranslationText(BuildContext context) {
    return FutureBuilder(
      future: chapterItem.translation(settingsTranslatorId),
      builder: (BuildContext context, AsyncSnapshot<ChapterTranslationItem> snapshot) {
        if (snapshot.hasData)
          return Text(
            snapshot.data.text,
            style: Theme.of(context).textTheme.display1
          );

        return InlineBouncingLoading();
      }
    );
  }

  Widget _buildChapterOrder(BuildContext context) {
    final order = AppLocalizations.of(context).translateFormatted(
      'chapter-item-order',
      {
        'order': chapterItem.order
      }
    );

    return Text(
      order,
      style: Theme.of(context).textTheme.display1
    );
  }

  Widget _buildChapterPartNumber(BuildContext context) {
    final partNumber = AppLocalizations.of(context).translateFormatted(
      'chapter-item-part-number',
      {
        'partNumber': chapterItem.partNumber
      }
    );

    return Text(
      partNumber,
      style: Theme.of(context).textTheme.display1
    );
  }

  Widget _buildChapterRevelationPlaceAndVersesCount(BuildContext context) {
    final revelationPlaceAndVersesCount = AppLocalizations.of(context).translateFormatted(
      'chapter-item-revelation-place-and-verses-count',
      {
        'revelationPlace': AppLocalizations.of(context).translateEnum(chapterItem.revelationPlace),
        'versesCount': chapterItem.versesCount
      }
    );

    return Text(
      revelationPlaceAndVersesCount,
      style: Theme.of(context).textTheme.display1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: chapterItem.id % 2 == 0 ? Theme.of(context).indicatorColor.withAlpha(35) : null,
      child: InkWell(
        onTap: () => onChapterItemTapped(context, chapterItem),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    _buildChapterRevelationPlaceAndVersesCount(context)
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
