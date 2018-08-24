import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:Quran/states/app_state.dart';
import 'package:Quran/view_models/chapter_view_model.dart';
import 'package:Quran/presentation/chapter_list.dart';

class ChapterListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChapterListViewModel>(
      converter: ChapterListViewModel.fromStore,
      builder: (context, chapterListViewModel)  => ChapterList(
        chapterListLoading: chapterListViewModel.chapterListLoading,
        chapterListLoadSucceeded: chapterListViewModel.chapterListLoadSucceeded,
        chapterListItems: chapterListViewModel.chapterListItems,
        chapterListLoadFailed: chapterListViewModel.chapterListLoadFailed,
        chapterListLoadError: chapterListViewModel.chapterListLoadError,
        onChapterItemTapped: chapterListViewModel.onChapterItemTapped
      )
    );
  }
}