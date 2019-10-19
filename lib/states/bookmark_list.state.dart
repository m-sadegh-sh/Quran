import 'package:quran/items/bookmark.item.dart';

class BookmarkListState {
  final bool bookmarkListLoading;
  final bool bookmarkListLoadSucceeded;
  final List<BookmarkItem> bookmarkListItems;
  final bool bookmarkListLoadFailed;
  final String bookmarkListLoadError;

  BookmarkListState({
    this.bookmarkListLoading,
    this.bookmarkListLoadSucceeded,
    this.bookmarkListItems,
    this.bookmarkListLoadFailed,
    this.bookmarkListLoadError
  });

  factory BookmarkListState.initial() => BookmarkListState(
    bookmarkListLoading: false,
    bookmarkListLoadSucceeded: false,
    bookmarkListItems: List<BookmarkItem>.unmodifiable([]),
    bookmarkListLoadFailed: false,
    bookmarkListLoadError: null
  );

  BookmarkListState copyWith({
    bookmarkListLoading,
    bookmarkListLoadSucceeded,
    bookmarkListItems,
    bookmarkListLoadFailed,
    bookmarkListLoadError
  }) => BookmarkListState(
    bookmarkListLoading: bookmarkListLoading ?? this.bookmarkListLoading,
    bookmarkListLoadSucceeded: bookmarkListLoadSucceeded ?? this.bookmarkListLoadSucceeded,
    bookmarkListItems: bookmarkListItems ?? this.bookmarkListItems,
    bookmarkListLoadFailed: bookmarkListLoadFailed ?? this.bookmarkListLoadFailed,
    bookmarkListLoadError: bookmarkListLoadError ?? this.bookmarkListLoadError
  );
}
