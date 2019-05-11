import 'package:redux/redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/states/chapter_details.state.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/chapter.item.dart';
import 'package:quran/items/chapter_translation.item.dart';
import 'package:quran/items/verse.item.dart';
import 'package:quran/items/verse_translation.item.dart';

ChapterDetailsState chapterDetailsStateSelector(RootState state) => state.chapterDetailsState;
GeneratorW1P<double, List<ActionItem>> chapterDetailsOnGenerateActionItemsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateActionItems;
ChapterItem chapterDetailsChapterItemSelector(ChapterDetailsState state) => state.chapterDetailsChapterItem;
ChapterTranslationItem chapterDetailsChapterTranslationItemSelector(ChapterDetailsState state) => state.chapterDetailsChapterTranslationItem;
bool chapterDetailsLoadingSelector(ChapterDetailsState state) => state.chapterDetailsLoading;
bool chapterDetailsLoadSucceededSelector(ChapterDetailsState state) => state.chapterDetailsLoadSucceeded;
List<VerseItem> chapterDetailsVerseItemsSelector(ChapterDetailsState state) => state.chapterDetailsVerseItems;
String chapterDetailsBackgroundImageSelector(ChapterDetailsState state) => state.chapterDetailsBackgroundImage;
bool chapterDetailsLoadFailedSelector(ChapterDetailsState state) => state.chapterDetailsLoadFailed;
String chapterDetailsLoadErrorSelector(ChapterDetailsState state) => state.chapterDetailsLoadError;
GeneratorW5P<Store<RootState>, ChapterItem, ChapterTranslationItem, VerseItem, VerseTranslationItem, List<IconSlideAction>> chapterDetailsOnGenerateSlidableActionsSelector(ChapterDetailsState state) => state.chapterDetailsOnGenerateSlidableActions;
SlidableController chapterDetailsSlidableControllerSelector(ChapterDetailsState state) => state.chapterDetailsSlidableController;
