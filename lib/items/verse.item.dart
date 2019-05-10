import 'dart:async';
import 'package:kiwi/kiwi.dart';

import 'package:quran/repositories/verse_translation.repository.dart';
import 'package:quran/items/verse_translation.item.dart';

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
    return await Container().resolve<VerseTranslationRepository>().findOneByVerseId(id, translatorId);
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
