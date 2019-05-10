class ChapterTranslationItem {
  final int id;
  final int chapterId;
  final int translatorId;
  final String text;

  ChapterTranslationItem({
    this.id,
    this.chapterId,
    this.translatorId,
    this.text
  });
  
  factory ChapterTranslationItem.fromJson(dynamic parsedJson) {
    return ChapterTranslationItem(
      id: parsedJson['id'],
      chapterId: parsedJson['chapterId'],
      translatorId: parsedJson['translatorId'],
      text: parsedJson['text']
    );
  }
}
