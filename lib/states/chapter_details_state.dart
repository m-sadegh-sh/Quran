import 'package:Quran/items/chapter_item.dart';

class ChapterDetailsState {
  final int chapterDetailsItemId;
  final bool chapterDetailsLoading;
  final bool chapterDetailsLoadSucceeded;
  final ChapterItem chapterDetailsItem;
  final bool chapterDetailsLoadFailed;
  final String chapterDetailsLoadError;

  ChapterDetailsState({
    this.chapterDetailsItemId,
    this.chapterDetailsLoading,
    this.chapterDetailsLoadSucceeded,
    this.chapterDetailsItem,
    this.chapterDetailsLoadFailed,
    this.chapterDetailsLoadError
  });

  factory ChapterDetailsState.initial() => ChapterDetailsState(
    chapterDetailsItemId: null,
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsItem: null,
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );

  ChapterDetailsState copyWith({
    chapterDetailsItemId,
    chapterDetailsLoading,
    chapterDetailsLoadSucceeded,
    chapterDetailsItem,
    chapterDetailsLoadFailed,
    chapterDetailsLoadError
  }) => ChapterDetailsState(
    chapterDetailsItemId: chapterDetailsItemId ?? this.chapterDetailsItemId,
    chapterDetailsLoading: chapterDetailsLoading ?? this.chapterDetailsLoading,
    chapterDetailsLoadSucceeded: chapterDetailsLoadSucceeded ?? this.chapterDetailsLoadSucceeded,
    chapterDetailsItem: chapterDetailsItem ?? this.chapterDetailsItem,
    chapterDetailsLoadFailed: chapterDetailsLoadFailed ?? this.chapterDetailsLoadFailed,
    chapterDetailsLoadError: chapterDetailsLoadError ?? this.chapterDetailsLoadError
  );
}
