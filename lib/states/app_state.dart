import 'package:Quran/states/chapter_list_state.dart';

class AppState {
  ChapterListState chapter;

  AppState({
    this.chapter
  });

  factory AppState.initial() => AppState(
    chapter: ChapterListState.initial()
  );
}