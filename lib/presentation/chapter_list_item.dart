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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => chapterListOnChapterItemTapped(context, chapterItem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            chapterItem.id.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            )
          ),
          Text(
            chapterItem.partNumber.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            )
          ),
          Divider()
        ]
      )
    );
  }
}
