import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/view_models/chapter_details_view_model.dart';
import 'package:quran/presentation/chapter_details.dart';

class ChapterDetailsContainer extends StatelessWidget {
  static const String routeName = '/chapter-details';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, ChapterDetailsViewModel>(
      converter: ChapterDetailsViewModel.fromStore,
      builder: (BuildContext context, ChapterDetailsViewModel chapterDetailsViewModel) => ChapterDetails(
        chapterDetailsChapterItem: chapterDetailsViewModel.chapterDetailsChapterItem,
        chapterDetailsActionItems: chapterDetailsViewModel.chapterDetailsOnGenerateActionItems(context, chapterDetailsViewModel.settingsThemeFontSize),
        chapterDetailsOnActionItemPressed: chapterDetailsViewModel.chapterDetailsOnActionItemPressed,
        chapterDetailsOnActionChildItemPressed: chapterDetailsViewModel.chapterDetailsOnActionChildItemPressed,
        chapterDetailsLoading: chapterDetailsViewModel.chapterDetailsLoading,
        chapterDetailsLoadSucceeded: chapterDetailsViewModel.chapterDetailsLoadSucceeded,
        chapterDetailsVerseItems: chapterDetailsViewModel.chapterDetailsVerseItems,
        chapterDetailsBackgroundImage: chapterDetailsViewModel.chapterDetailsBackgroundImage,
        chapterDetailsLoadFailed: chapterDetailsViewModel.chapterDetailsLoadFailed,
        chapterDetailsLoadError: chapterDetailsViewModel.chapterDetailsLoadError,
        chapterDetailsLoad: chapterDetailsViewModel.chapterDetailsLoad,
        settingsTranslatorId: chapterDetailsViewModel.settingsTranslatorId
      )
    );
  }
}