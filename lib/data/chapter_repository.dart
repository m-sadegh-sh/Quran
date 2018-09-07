import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterRepository extends RepositoryBase<ChapterItem> {
  static ChapterRepository _instance;

  ChapterRepository.protected();

  factory ChapterRepository() {
    if (_instance == null)
      _instance = ChapterRepository._private();

    return _instance;
  }

  ChapterRepository._private();

  @override
  String get dataFileName => "chapters";

  @override
  ChapterItem fromJson(dynamic parsedJson) => ChapterItem.fromJson(parsedJson);
}
