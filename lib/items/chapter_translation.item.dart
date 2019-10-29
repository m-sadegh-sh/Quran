class ChapterTranslationItem {
  final int id;
  final int chapterId;
  final int translatorId;
  final String title;

  ChapterTranslationItem({
    this.id,
    this.chapterId,
    this.translatorId,
    this.title
  });
  
  factory ChapterTranslationItem.fromJson(dynamic parsedJson) {
    return ChapterTranslationItem(
      id: parsedJson['id'],
      chapterId: parsedJson['chapterId'],
      translatorId: parsedJson['translatorId'],
      title: parsedJson['title']
    );
  }
}
