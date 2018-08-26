class TranslatorItem {
  final int id;
  final String name;
  final String localeCode;

  TranslatorItem({
    this.id,
    this.name,
    this.localeCode
  });

  factory TranslatorItem.fromJson(dynamic parsedJson) {
    return TranslatorItem(
      id: parsedJson['id'],
      name: parsedJson['name'],
      localeCode: parsedJson['localeCode']
    );
  }
}
