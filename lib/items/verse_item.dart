import 'dart:async';

import 'package:Quran/data/verse_translation_repository.dart';
import 'package:Quran/items/verse_translation_item.dart';

class VerseItem {
  final int id;
  final int chapterId;
  final String fullText;
  final String cleanText;

  VerseItem({
    this.id,
    this.chapterId,
    this.fullText,
    this.cleanText
  });

  Future<VerseTranslationItem> translation() async {
    return VerseTranslationRepository().findByVerseId(id);
  }

  factory VerseItem.fromJson(dynamic parsedJson) {
    return VerseItem(
      id: parsedJson['id'],
      chapterId: parsedJson['chapterId'],
      fullText: parsedJson['fullText'],
      cleanText: parsedJson['cleanText']
    );
  }
}
