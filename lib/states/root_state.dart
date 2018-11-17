import 'package:redux_persist/redux_persist.dart';

import 'package:quran/states/app_state.dart';
import 'package:quran/states/home_state.dart';
import 'package:quran/states/chapter_list_state.dart';
import 'package:quran/states/chapter_details_state.dart';

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

  static RootState fromJson(dynamic json) => JsonSerializer(null).decode(json);

  dynamic toJson() => JsonSerializer(null).encode(this);
}