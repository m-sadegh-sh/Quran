import 'dart:async';
import 'package:kiwi/kiwi.dart';

import 'package:quran/items/verse.item.dart';
import 'package:quran/repositories/verse.repository.dart';

class BookmarkItem {
  final int verseId;

  BookmarkItem({
    this.verseId
  });

  Future<VerseItem> load() async {
    return await Container().resolve<VerseRepository>().findOneById(verseId);
  }

  factory BookmarkItem.fromJson(dynamic parsedJson) {
    return BookmarkItem(
      verseId: parsedJson['verseId']
    );
  }
}
