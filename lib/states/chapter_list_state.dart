import 'package:Quran/items/chapter_item.dart';

class ChapterListState {
  bool chapterListLoading;
  bool chapterListLoadSucceeded;
  List<ChapterItem> chapterList;
  bool chapterListLoadFailed;
  String chapterListLoadError;

  ChapterListState({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterList,
    this.chapterListLoadFailed,
    this.chapterListLoadError
  });

  factory ChapterListState.initial() => ChapterListState(
    chapterListLoading: false,
    chapterListLoadSucceeded: false,
    chapterList: List.unmodifiable([]),
    chapterListLoadFailed: false,
    chapterListLoadError: null
  );

  ChapterListState copyWith({
    chapterListLoading,
    chapterListLoadSucceeded,
    chapterList,
    chapterListLoadFailed,
    chapterListLoadError
  }) => ChapterListState(
    chapterListLoading: chapterListLoading ?? this.chapterListLoading,
    chapterListLoadSucceeded: chapterListLoadSucceeded ?? this.chapterListLoadSucceeded,
    chapterList: chapterList ?? this.chapterList,
    chapterListLoadFailed: chapterListLoadFailed ?? this.chapterListLoadFailed,
    chapterListLoadError: chapterListLoadError ?? this.chapterListLoadError
  );
}
