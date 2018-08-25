import 'package:flutter/material.dart';

import 'package:Quran/items/chapter_item.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterItem chapterItem;
  final Function(BuildContext, ChapterItem) chapterListOnItemTapped;

  ChapterListItem({
    Key key,
    this.chapterItem,
    this.chapterListOnItemTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => chapterListOnItemTapped(context, chapterItem),
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
