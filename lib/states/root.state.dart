import 'package:quran/states/about.state.dart';
import 'package:quran/states/app.state.dart';
import 'package:quran/states/help_and_support.state.dart';
import 'package:quran/states/settings.state.dart';
import 'package:quran/states/home.state.dart';
import 'package:quran/states/chapter_list.state.dart';
import 'package:quran/states/chapter_details.state.dart';

class RootState {
  final AppState appState;
  final SettingsState settingsState;
  final HomeState homeState;
  final ChapterListState chapterListState;
  final ChapterDetailsState chapterDetailsState;
  final HelpAndSupportState helpAndSupportState;
  final AboutState aboutState;

  RootState({
    this.appState,
    this.settingsState,
    this.homeState,
    this.chapterListState,
    this.chapterDetailsState,
    this.helpAndSupportState,
    this.aboutState
  });

  factory RootState.initial() => RootState(
    appState: AppState.initial(),
    settingsState: SettingsState.initial(),
    homeState: HomeState.initial(),
    chapterListState: ChapterListState.initial(),
    chapterDetailsState: ChapterDetailsState.initial(),
    helpAndSupportState: HelpAndSupportState.initial(),
    aboutState: AboutState.initial()
  );
}