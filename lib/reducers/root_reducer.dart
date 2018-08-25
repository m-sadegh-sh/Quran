import 'package:Quran/states/root_state.dart';
import 'package:Quran/reducers/app_reducer.dart';
import 'package:Quran/reducers/home_reducer.dart';
import 'package:Quran/reducers/chapter_list_reducer.dart';

RootState rootReducer(RootState state, action) => RootState(
  appState: appReducer(state.appState, action),
  homeState: homeReducer(state.homeState, action),
  chapterListState: chapterListReducer(state.chapterListState, action)
);