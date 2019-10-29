class BookmarkItem {
  final int verseId;

  BookmarkItem({
    this.verseId
  });

  factory BookmarkItem.fromJson(dynamic parsedJson) {
    return BookmarkItem(
      verseId: parsedJson['verseId']
    );
  }
}
