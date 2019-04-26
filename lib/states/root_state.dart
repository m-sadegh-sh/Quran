import 'package:quran/states/app_state.dart';
import 'package:quran/states/settings_state.dart';
import 'package:quran/states/home_state.dart';
import 'package:quran/states/chapter_list_state.dart';
import 'package:quran/states/chapter_details_state.dart';

class RootState {
  final AppState appState;
  final SettingsState settingsState;
  final HomeState homeState;
  final ChapterListState chapterListState;
  final ChapterDetailsState chapterDetailsState;

  RootState({
    this.appState,
    this.settingsState,
    this.homeState,
    this.chapterListState,
    this.chapterDetailsState
  });

  factory RootState.initial() => RootState(
    appState: AppState.initial(),
    settingsState: SettingsState.initial(),
    homeState: HomeState.initial(),
    chapterListState: ChapterListState.initial(),
    chapterDetailsState: ChapterDetailsState.initial()
  );
}