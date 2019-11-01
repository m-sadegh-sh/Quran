import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/items/chapter.item.dart';

class ChapterListItemScreen extends StatelessWidget {
  final int index;
  final ChapterItem chapterItem;
  final Function(BuildContext, ChapterItem, int) onChapterItemTapped;
  final String homeSearchQuery;
  final int settingsTranslatorId;

  ChapterListItemScreen({
    Key key,
    this.index,
    this.chapterItem,
    this.onChapterItemTapped,
    this.homeSearchQuery,
    this.settingsTranslatorId
  }) : super(key: key);

  bool get isIndicatable {
    return index % 2 == 1;
  }

  Widget _buildChapterNumber(BuildContext context) {
    return Container(
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
              chapterItem.id.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display4
            )
          ]
        )
      )
    );
  }

  Widget _buildChapterFullTitle(BuildContext context) {
    return Text(
      chapterItem.fullTitle,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildChapterTranslatedTitle(BuildContext context, ChapterItem chapterItem) {
    return Text(
      chapterItem.translatedTitle ?? '',
      style: Theme.of(context).textTheme.display1
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
      color: isIndicatable ? Theme.of(context).indicatorColor.withOpacity(0.2) : null,
      child: InkWell(
        onTap: () => onChapterItemTapped(context, chapterItem, settingsTranslatorId),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChapterNumber(context),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildChapterFullTitle(context),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: _buildChapterTranslatedTitle(context, chapterItem)
                      )
                    ]
                  )
                )
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildChapterPartNumber(context),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0
                      ),
                      child: _buildChapterOrder(context)
                    ),
                    _buildChapterRevelationPlaceAndVersesCount(context)
                  ]
                )
              )
            ],
          )
        )
      )
    );
  }
}
