import 'package:Quran/presentation/chapter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/view_models/chapter_view_model.dart';

class ChapterListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ChapterListState, ChapterListViewModel>(
      converter: ChapterListViewModel.fromStore,
      builder: (context, viewModel)  => ChapterList(
        chapterListLoading: viewModel.chapterListLoading,
        chapterListLoadSucceeded: viewModel.chapterListLoadSucceeded,
        chapterList: viewModel.chapterList,
        chapterListLoadFailed: viewModel.chapterListLoadFailed,
        chapterListLoadError: viewModel.chapterListLoadError,
        onChapterItemTapped: viewModel.onChapterItemTapped
      ),
    );
  }
}