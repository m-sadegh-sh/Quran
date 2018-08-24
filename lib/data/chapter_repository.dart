import 'package:Quran/data/repository_base.dart';
import 'package:Quran/models/chapter_model.dart';

class ChapterRepository extends RepositoryBase<ChapterModel> {
  ChapterRepository() : super.protected();

  ChapterModel fromJson(Map<String, dynamic> parsedJson) => ChapterModel.fromJson(parsedJson);
}
