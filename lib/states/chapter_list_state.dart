import 'package:Quran/items/chapter_item.dart';

class ChapterListState {
  bool chapterListLoading;
  bool chapterListLoadSucceeded;
  List<ChapterItem> chapterListItems;
  bool chapterListLoadFailed;
  String chapterListLoadError;

  ChapterListState({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterListItems,
    this.chapterListLoadFailed,
    this.chapterListLoadError
  });

  factory ChapterListState.initial() => ChapterListState(
    chapterListLoading: false,
    chapterListLoadSucceeded: false,
    chapterListItems: List.unmodifiable([]),
    chapterListLoadFailed: false,
    chapterListLoadError: null
  );

  ChapterListState copyWith({
    chapterListLoading,
    chapterListLoadSucceeded,
    chapterListItems,
    chapterListLoadFailed,
    chapterListLoadError
  }) => ChapterListState(
    chapterListLoading: chapterListLoading ?? this.chapterListLoading,
    chapterListLoadSucceeded: chapterListLoadSucceeded ?? this.chapterListLoadSucceeded,
    chapterListItems: chapterListItems ?? this.chapterListItems,
    chapterListLoadFailed: chapterListLoadFailed ?? this.chapterListLoadFailed,
    chapterListLoadError: chapterListLoadError ?? this.chapterListLoadError
  );
}
