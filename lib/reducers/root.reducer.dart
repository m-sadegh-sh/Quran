import 'package:quran/states/root.state.dart';
import 'package:quran/reducers/app.reducer.dart';
import 'package:quran/reducers/settings.reducer.dart';
import 'package:quran/reducers/home.reducer.dart';
import 'package:quran/reducers/chapter_list.reducer.dart';
import 'package:quran/reducers/chapter_details.reducer.dart';

RootState rootReducer(RootState state, action) => RootState(
  appState: appReducer(state.appState, action),
  settingsState: settingsReducer(state.settingsState, action),
  homeState: homeReducer(state.homeState, action),
  chapterListState: chapterListReducer(state.chapterListState, action),
  chapterDetailsState: chapterDetailsReducer(state.chapterDetailsState, action)
);