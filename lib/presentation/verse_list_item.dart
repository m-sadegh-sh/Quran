import 'dart:async';

import 'package:Quran/items/verse_translation_item.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/verse_item.dart';

class VerseListItem extends StatelessWidget {
  final VerseItem verseItem;
  final Function(BuildContext, int) onVerseItemTapped;

  VerseListItem({
    Key key,
    this.verseItem,
    this.onVerseItemTapped
  }) : super(key: key);

  Widget _buildVerseNumber(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
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
                verseItem.id.toString(),
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

  Widget _buildVerseFullText() {
    return Container(
      child: Text(
        verseItem.fullText,
        style: TextStyle(
          fontSize: 18.0
        )
      )
    );
  }

  Widget _buildVerseTranslationText() {
    return FutureBuilder(      
      future: verseItem.translation(),
      builder: (BuildContext context, AsyncSnapshot<VerseTranslationItem> snapshot) =>
        Container(
        child: Text(
          snapshot.hasData ? snapshot.data.text : 'Loading',
          style: TextStyle(
            fontSize: 18.0
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onVerseItemTapped(context, verseItem.id),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildVerseFullText()
              ],
            ),
            _buildVerseNumber(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildVerseTranslationText()
              ],
            )
          ],
        )
      )
    );
  }
}
