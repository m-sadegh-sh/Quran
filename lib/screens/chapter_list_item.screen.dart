import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';

class ChapterListItemScreen extends StatelessWidget {
  final bool shimmed;
  final int index;
  final ChapterItem chapterItem;
  final Function(BuildContext, ChapterItem, ChapterTranslationItem) onChapterItemTapped;
  final String homeSearchQuery;
  final int settingsTranslatorId;

  ChapterListItemScreen({
    Key key,
    this.shimmed,
    this.index,
    this.chapterItem,
    this.onChapterItemTapped,
    this.homeSearchQuery,
    this.settingsTranslatorId
  }) : super(key: key);

  bool get isIndicatable {
    return index % 2 == 1;
  }

  Widget _buildChapterNumber(BuildContext context, bool shimmed) {
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
          children: <Widget>[
            Text(
              shimmed ? '' : chapterItem.id.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display4
            )
          ]
        )
      )
    );
  }

  Widget _buildChapterTitle(BuildContext context, bool shimmed) {
    return Text(
      shimmed == true ? '' : chapterItem.title,
      style: Theme.of(context).textTheme.title
    );
  }

  Widget _buildChapterTranslationText(BuildContext context, ChapterTranslationItem chapterTranslationItem, bool shimmed) {
    return Text(
      shimmed ? '' : chapterTranslationItem?.text ?? '',
      style: Theme.of(context).textTheme.display1
    );
  }

  Widget _buildChapterOrder(BuildContext context, bool shimmed) {
    final order = AppLocalizations.of(context).translateFormatted(
      'chapter-item-order',
      {
        'order': chapterItem.order
      }
    );

    return Text(
      shimmed ? '' : order,
      style: Theme.of(context).textTheme.display1
    );
  }

  Widget _buildChapterPartNumber(BuildContext context, bool shimmed) {
    final partNumber = AppLocalizations.of(context).translateFormatted(
      'chapter-item-part-number',
      {
        'partNumber': chapterItem.partNumber
      }
    );

    return Text(
      shimmed ? '' : partNumber,
      style: Theme.of(context).textTheme.display1
    );
  }

  Widget _buildChapterRevelationPlaceAndVersesCount(BuildContext context, bool shimmed) {
    final revelationPlaceAndVersesCount = AppLocalizations.of(context).translateFormatted(
      'chapter-item-revelation-place-and-verses-count',
      {
        'revelationPlace': AppLocalizations.of(context).translateEnum(chapterItem.revelationPlace),
        'versesCount': chapterItem.versesCount
      }
    );

    return Text(
      shimmed ? '' : revelationPlaceAndVersesCount,
      style: Theme.of(context).textTheme.display1
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chapterItem.translation(settingsTranslatorId),
      builder: (BuildContext context, AsyncSnapshot<ChapterTranslationItem> snapshot) {
        if (snapshot.hasData)
          return Material(
            color: isIndicatable ? Theme.of(context).indicatorColor.withOpacity(0.2) : null,
            child: InkWell(
              onTap: () => onChapterItemTapped(context, chapterItem, snapshot.data),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildChapterNumber(context, shimmed),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildChapterTitle(context, shimmed),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: _buildChapterTranslationText(context, snapshot.data, shimmed)
                            )
                          ]
                        )
                      )
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildChapterPartNumber(context, shimmed),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0
                            ),
                            child: _buildChapterOrder(context, shimmed)
                          ),
                          _buildChapterRevelationPlaceAndVersesCount(context, shimmed)
                        ]
                      )
                    )
                  ],
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
                  _buildChapterNumber(context, true),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Theme.of(context).textTheme.title.color.withOpacity(0.5),
                            child: _buildChapterTitle(context, true)
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 5.0),
                            color: Theme.of(context).textTheme.display1.color.withOpacity(0.5),
                            child: _buildChapterTranslationText(context, null, true),
                          )
                        ]
                      )
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          color: Theme.of(context).textTheme.display1.color.withOpacity(0.5),
                          child: _buildChapterPartNumber(context, true)
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0
                          ),
                          color: Theme.of(context).textTheme.display1.color.withOpacity(0.5),
                          child: _buildChapterOrder(context, true)
                        ),
                        Container(
                          width: double.infinity,
                          color: Theme.of(context).textTheme.display1.color.withOpacity(0.5),
                          child: _buildChapterRevelationPlaceAndVersesCount(context, true)
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
