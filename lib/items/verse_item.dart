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

  factory VerseItem.fromJson(dynamic parsedJson) {
    return VerseItem(
      id: parsedJson['id'],
      chapterId: parsedJson['chapterId'],
      fullText: parsedJson['fullText'],
      cleanText: parsedJson['cleanText']
    );
  }
}
