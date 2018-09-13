import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/items/verse_translation_item.dart';
import 'package:Quran/items/verse_item.dart';

class VerseListItem extends StatelessWidget {
  final VerseItem verseItem;
  final Function(BuildContext, int) onVerseItemTapped;
  final int currentTranslatorId;

  VerseListItem({
    Key key,
    this.verseItem,
    this.onVerseItemTapped,
    this.currentTranslatorId
  }) : super(key: key);

  Widget _buildVerseNumber(BuildContext context) {
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
                verseItem.chapterVerseId.toString(),
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

  Widget _buildVerseFullText(BuildContext context) {
    return Text(
      verseItem.fullText,
      style: Theme.of(context).textTheme.title.apply(
        fontWeightDelta: -2,
        fontSizeDelta: 2.0,
        fontFamily: 'Nabi'
      )
    );
  }

  Widget _buildVerseTranslationText(BuildContext context) {
    return FutureBuilder(
      future: verseItem.translation(currentTranslatorId),
      builder: (BuildContext context, AsyncSnapshot<VerseTranslationItem> snapshot) =>
        Text(
          snapshot.hasData ? snapshot.data.text : AppLocalizations.of(context).translate('verse-item-translation-text'),
          style: Theme.of(context).textTheme.caption.apply(
            fontWeightDelta: -1
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: verseItem.id % 2 == 0 ? Theme.of(context).indicatorColor.withAlpha(35) : null,
      child: InkWell(
        onTap: () => onVerseItemTapped(context, verseItem.id),
        child: Container(
          padding: const EdgeInsets.all(10.0),
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
                      _buildVerseTranslationText(context)
                    ],
                  )
                )
              )
            ],
          )
        )
      )
    );
  }
}
