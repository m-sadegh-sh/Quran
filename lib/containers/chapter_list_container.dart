import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/view_models/chapter_list_view_model.dart';
import 'package:quran/presentation/chapter_list.dart';

class ChapterListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, ChapterListViewModel>(
      converter: ChapterListViewModel.fromStore,
      builder: (BuildContext context, ChapterListViewModel chapterListViewModel) => ChapterList(
        chapterListLoading: chapterListViewModel.chapterListLoading,
        chapterListLoadSucceeded: chapterListViewModel.chapterListLoadSucceeded,
        chapterListItems: chapterListViewModel.chapterListItems,
        chapterListLoadFailed: chapterListViewModel.chapterListLoadFailed,
        chapterListLoadError: chapterListViewModel.chapterListLoadError,
        chapterListLoad: chapterListViewModel.chapterListLoad,
        chapterListOnChapterItemTapped: chapterListViewModel.chapterListOnChapterItemTapped,
        chapterListCurrentTranslatorId: chapterListViewModel.chapterListCurrentTranslatorId
      )
    );
  }
}