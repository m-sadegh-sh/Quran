import 'package:quran/states/root_state.dart';
import 'package:quran/reducers/app_reducer.dart';
import 'package:quran/reducers/settings_reducer.dart';
import 'package:quran/reducers/home_reducer.dart';
import 'package:quran/reducers/chapter_list_reducer.dart';
import 'package:quran/reducers/chapter_details_reducer.dart';

RootState rootReducer(RootState state, action) => RootState(
  appState: appReducer(state.appState, action),
  settingsState: settingsReducer(state.settingsState, action),
  homeState: homeReducer(state.homeState, action),
  chapterListState: chapterListReducer(state.chapterListState, action),
  chapterDetailsState: chapterDetailsReducer(state.chapterDetailsState, action)
);