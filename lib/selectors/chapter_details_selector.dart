import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generators.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/states/root_state.dart';
import 'package:quran/states/chapter_details_state.dart';
import 'package:quran/items/chapter_item.dart';
import 'package:quran/items/verse_item.dart';

ChapterDetailsState chapterDetailsStateSelector(RootState state) => state.chapterDetailsState;
GeneratorW1P<double, List<ActionItem>> chapterDetailsOnGenerateActionItemsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateActionItems;
ChapterItem chapterDetailsChapterItemSelector(ChapterDetailsState state) => state.chapterDetailsChapterItem;
bool chapterDetailsLoadingSelector(ChapterDetailsState state) => state.chapterDetailsLoading;
bool chapterDetailsLoadSucceededSelector(ChapterDetailsState state) => state.chapterDetailsLoadSucceeded;
List<VerseItem> chapterDetailsVerseItemsSelector(ChapterDetailsState state) => state.chapterDetailsVerseItems;
String chapterDetailsBackgroundImageSelector(ChapterDetailsState state) => state.chapterDetailsBackgroundImage;
bool chapterDetailsLoadFailedSelector(ChapterDetailsState state) => state.chapterDetailsLoadFailed;
String chapterDetailsLoadErrorSelector(ChapterDetailsState state) => state.chapterDetailsLoadError;
GeneratorWNP<List<IconSlideAction>> chapterDetailsOnGenerateSlidableActionsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateSlidableActions;
SlidableController chapterDetailsSlidableControllerSelector(ChapterDetailsState state) => state.chapterDetailsSlidableController;
