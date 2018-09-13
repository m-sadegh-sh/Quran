import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/view_models/chapter_details_view_model.dart';
import 'package:Quran/presentation/chapter_details.dart';

class ChapterDetailsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, ChapterDetailsViewModel>(
      converter: ChapterDetailsViewModel.fromStore,
      builder: (BuildContext context, ChapterDetailsViewModel chapterDetailsViewModel) => ChapterDetails(
        chapterDetailsChapterItem: chapterDetailsViewModel.chapterDetailsChapterItem,
        chapterDetailsActionItems: chapterDetailsViewModel.chapterDetailsOnGenerateActionItems(context),
        chapterDetailsOnActionItemPressed: chapterDetailsViewModel.chapterDetailsOnActionItemPressed,
        chapterDetailsLoading: chapterDetailsViewModel.chapterDetailsLoading,
        chapterDetailsLoadSucceeded: chapterDetailsViewModel.chapterDetailsLoadSucceeded,
        chapterDetailsVerseItems: chapterDetailsViewModel.chapterDetailsVerseItems,
        chapterDetailsBackgroundImage: chapterDetailsViewModel.chapterDetailsBackgroundImage,
        chapterDetailsLoadFailed: chapterDetailsViewModel.chapterDetailsLoadFailed,
        chapterDetailsLoadError: chapterDetailsViewModel.chapterDetailsLoadError,
        chapterDetailsLoad: chapterDetailsViewModel.chapterDetailsLoad,
        chapterDetailsCurrentTranslatorId: chapterDetailsViewModel.chapterDetailsCurrentTranslatorId
      )
    );
  }
}