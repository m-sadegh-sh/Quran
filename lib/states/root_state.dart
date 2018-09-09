import 'package:Quran/states/app_state.dart';
import 'package:Quran/states/home_state.dart';
import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/states/chapter_details_state.dart';

class RootState {
  final AppState appState;
  final HomeState homeState;
  final ChapterListState chapterListState;
  final ChapterDetailsState chapterDetailsState;

  RootState({
    this.appState,
    this.homeState,
    this.chapterListState,
    this.chapterDetailsState
  });

  factory RootState.initial() => RootState(
    appState: AppState.initial(),
    homeState: HomeState.initial(),
    chapterListState: ChapterListState.initial(),
    chapterDetailsState: ChapterDetailsState.initial()
  );
}