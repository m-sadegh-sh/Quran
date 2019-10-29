class VerseItem {
  final int id;
  final bool showVerseId;
  final bool includesInSearch;
  final int chapterId;
  final int chapterVerseId;
  final String fullText;
  final String cleanText;
  final String translatedText;

  VerseItem({
    this.id,
    this.showVerseId,
    this.includesInSearch,
    this.chapterId,
    this.chapterVerseId,
    this.fullText,
    this.cleanText,
    this.translatedText
  });

  factory VerseItem.toTranslated(VerseItem verse, String translatedText) {
    return VerseItem(
      id: verse.id,
      showVerseId: verse.showVerseId,
      includesInSearch: verse.includesInSearch,
      chapterId: verse.chapterId,
      chapterVerseId: verse.chapterVerseId,
      fullText: verse.fullText,
      cleanText: verse.cleanText,
      translatedText: translatedText
    );
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
