import 'package:Quran/states/root_state.dart';
import 'package:Quran/states/chapter_details_state.dart';
import 'package:Quran/items/chapter_item.dart';

ChapterDetailsState chapterDetailsStateSelector(RootState state) => state.chapterDetailsState;
int chapterDetailsItemIdSelector(ChapterDetailsState state) => state.chapterDetailsItemId;
bool chapterDetailsLoadingSelector(ChapterDetailsState state) => state.chapterDetailsLoading;
bool chapterDetailsLoadSucceededSelector(ChapterDetailsState state) => state.chapterDetailsLoadSucceeded;
ChapterItem chapterDetailsItemSelector(ChapterDetailsState state) => state.chapterDetailsItem;
bool chapterDetailsLoadFailedSelector(ChapterDetailsState state) => state.chapterDetailsLoadFailed;
String chapterDetailsLoadErrorSelector(ChapterDetailsState state) => state.chapterDetailsLoadError;
