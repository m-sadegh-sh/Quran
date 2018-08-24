import 'package:Quran/models/chapter_model.dart';

class ChapterState {
  bool chapterListLoading;
  bool chapterListLoadSucceeded;
  List<ChapterModel> chapterList;
  bool chapterListLoadFailed;
  String chapterListLoadError;

  ChapterState({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterList,
    this.chapterListLoadFailed,
    this.chapterListLoadError
  });

  factory ChapterState.initial() => ChapterState(
    chapterListLoading: false,
    chapterListLoadSucceeded: false,
    chapterList: List.unmodifiable([]),
    chapterListLoadFailed: false,
    chapterListLoadError: null
  );

  ChapterState copyWith({
    chapterListLoading,
    chapterListLoadSucceeded,
    chapterList,
    chapterListLoadFailed,
    chapterListLoadError
  }) => ChapterState(
    chapterListLoading: chapterListLoading ?? this.chapterListLoading,
    chapterListLoadSucceeded: chapterListLoadSucceeded ?? this.chapterListLoadSucceeded,
    chapterList: chapterList ?? this.chapterList,
    chapterListLoadFailed: chapterListLoadFailed ?? this.chapterListLoadFailed,
    chapterListLoadError: chapterListLoadError ?? this.chapterListLoadError
  );
}
