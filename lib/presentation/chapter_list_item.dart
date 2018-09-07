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

  Widget _buildChapterTitle() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => chapterListOnChapterItemTapped(context, chapterItem),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildChapterTitle(),
                _buildChapterDescription(context)
              ],
            )
          ],
        )
      )
    );
  }
}
