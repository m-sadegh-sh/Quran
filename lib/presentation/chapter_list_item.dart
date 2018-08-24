import 'package:flutter/material.dart';

import 'package:Quran/models/chapter_model.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterModel chapterItem;
  final Function(ChapterModel) onItemPressed;

  ChapterListItem({
    Key key,
    this.chapterItem,
    this.onItemPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemPressed(chapterItem),
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
