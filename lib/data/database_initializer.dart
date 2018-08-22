import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:Quran/data/chapter_repository.dart';
import 'package:Quran/models/chapter_model.dart';

class DatabaseInitializer {
  final ChapterRepository _chapterRepository;

  DatabaseInitializer(this._chapterRepository);

  void seed() async {
    var chapters = await _loadChapters();

    for (var chapter in chapters)
      _chapterRepository.insertChapter(chapter);
  }

  Future<List<ChapterModel>> _loadChapters() async {
    final key = 'assets/data/chapters.json';
    String data = await rootBundle.loadString(key);
    return json.decode(data);
  }
}
