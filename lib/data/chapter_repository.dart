import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterRepository extends RepositoryBase<ChapterItem> {
  ChapterRepository() : super.protected();

  ChapterItem fromJson(Map<String, dynamic> parsedJson) => ChapterItem.fromJson(parsedJson);
}
