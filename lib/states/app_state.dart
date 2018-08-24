import 'package:Quran/states/chapter_state.dart';

class AppState {
  ChapterState chapter;

  AppState({
    this.chapter
  });

  factory AppState.initial() => AppState(
    chapter: ChapterState.initial()
  );
}