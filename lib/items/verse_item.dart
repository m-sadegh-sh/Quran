import 'dart:async';

import 'package:quran/data/verse_translation_repository.dart';
import 'package:quran/items/verse_translation_item.dart';

class VerseItem {
  final int id;
  final bool showVerseId;
  final bool includesInSearch;
  final int chapterId;
  final int chapterVerseId;
  final String fullText;
  final String cleanText;

  VerseItem({
    this.id,
    this.showVerseId,
    this.includesInSearch,
    this.chapterId,
    this.chapterVerseId,
    this.fullText,
    this.cleanText
  });

  Future<VerseTranslationItem> translation(int translatorId) async {
    return await VerseTranslationRepository().findOneByVerseId(id, translatorId);
  }

  factory VerseItem.fromJson(dynamic parsedJson) {
    return VerseItem(
      id: parsedJson['id'],
      showVerseId: parsedJson['showVerseId'],
      includesInSearch: parsedJson['includesInSearch'],
      chapterId: parsedJson['chapterId'],
      chapterVerseId: parsedJson['chapterVerseId'],
      fullText: parsedJson['fullText'],
      cleanText: parsedJson['cleanText']
    );
  }
}
