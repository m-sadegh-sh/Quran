class VerseTranslationItem {
  final int id;
  final int verseId;
  final int translatorId;
  final String text;

  VerseTranslationItem({
    this.id,
    this.verseId,
    this.translatorId,
    this.text
  });

  factory VerseTranslationItem.fromJson(dynamic parsedJson) {
    return VerseTranslationItem(
      id: parsedJson['id'],
      verseId: parsedJson['verseId'],
      translatorId: parsedJson['translatorId'],
      text: parsedJson['text']
    );
  }
}
