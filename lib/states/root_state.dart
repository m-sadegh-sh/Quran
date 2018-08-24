import 'package:Quran/states/app_state.dart';
import 'package:Quran/states/chapter_list_state.dart';

class RootState {
  AppState appState;
  ChapterListState chapterListState;

  RootState({
    this.appState,
    this.chapterListState
  });

  factory RootState.initial() => RootState(
    appState: AppState.initial(),
    chapterListState: ChapterListState.initial()
  );
}