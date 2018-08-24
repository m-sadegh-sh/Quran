import 'package:Quran/states/app_state.dart';
import 'package:Quran/reducers/chapter_list_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
  chapter: chapterReducer(state.chapter, action)
);