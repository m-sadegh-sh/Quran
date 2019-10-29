import 'package:redux/redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/chapter_details.state.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/verse.item.dart';

ChapterDetailsState chapterDetailsStateSelector(RootState state) => state.chapterDetailsState;
GeneratorW3P<bool, double, int, List<ActionItem>> chapterDetailsOnGenerateActionItemsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateActionItems;
ChapterItem chapterDetailsChapterItemSelector(ChapterDetailsState state) => state.chapterDetailsChapterItem;
bool chapterDetailsLoadingSelector(ChapterDetailsState state) => state.chapterDetailsLoading;
bool chapterDetailsLoadSucceededSelector(ChapterDetailsState state) => state.chapterDetailsLoadSucceeded;
List<VerseItem> chapterDetailsVerseItemsSelector(ChapterDetailsState state) => state.chapterDetailsVerseItems;
String chapterDetailsBackgroundImageSelector(ChapterDetailsState state) => state.chapterDetailsBackgroundImage;
bool chapterDetailsLoadFailedSelector(ChapterDetailsState state) => state.chapterDetailsLoadFailed;
String chapterDetailsLoadErrorSelector(ChapterDetailsState state) => state.chapterDetailsLoadError;
bool chapterDetailsIsSearchingSelector(ChapterDetailsState state) => state.chapterDetailsIsSearching;
GeneratorWNP<String> chapterDetailsOnGenerateSearchHintTextSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateSearchHintText;
String chapterDetailsSearchQuerySelector(ChapterDetailsState state) => state.chapterDetailsSearchQuery;
GeneratorW3P<Store<RootState>, ChapterItem, VerseItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActionsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateSlidableActions;
SlidableController chapterDetailsSlidableControllerSelector(ChapterDetailsState state) => state.chapterDetailsSlidableController;
