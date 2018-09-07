import 'package:Quran/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterItem chapterItem;
  final Function(BuildContext, ChapterItem) chapterListOnChapterItemTapped;

  ChapterListItem({
    Key key,
    this.chapterItem,
    this.chapterListOnChapterItemTapped
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

  Widget _buildChapterTitle() {
    return Container(
      child: Text(
        chapterItem.title,
        style: TextStyle(
          fontSize: 18.0
        )
      )
    );
  }

  Widget _buildChapterDescription(BuildContext context) {
    var description = AppLocalizations.of(context).translateFormatted(
      "chapter-item-description",
      {
        "classification": AppLocalizations.of(context).translateEnum(chapterItem.classification),
        "versesCount": chapterItem.versesCount
      }        
    );

    return Text(
      description,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 14.0
      )
    );
  }

  Widget _buildChapterOrder(BuildContext context) {
    var description = AppLocalizations.of(context).translateFormatted(
      "chapter-item-order",
      {
        "order": chapterItem.order
      }        
    );

    return Text(
      description,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 14.0
      )
    );
  }

  Widget _buildChapterPartNumber(BuildContext context) {
    var description = AppLocalizations.of(context).translateFormatted(
      "chapter-item-part-number",
      {
        "partNumber": chapterItem.partNumber
      }        
    );

    return Text(
      description,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 14.0
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => chapterListOnChapterItemTapped(context, chapterItem),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(          
          children: <Widget>[
            _buildChapterNumber(context),
            Expanded(
              flex: 3,
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildChapterTitle(),
                  _buildChapterDescription(context)
                ],
              )
            ),
            Expanded(
              flex: 2,
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildChapterPartNumber(context),
                  _buildChapterOrder(context)
                ],
              )
            )
          ],
        )
      )
    );
  }
}
