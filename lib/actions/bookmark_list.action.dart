import 'package:flutter/material.dart';

import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/bookmark.item.dart';
import 'package:quran/states/bookmark_list.state.dart';

class BookmarkListReloadInitialStateAction { }

class BookmarkListReloadInitialStateSucceededAction {
  final BookmarkListState bookmarkListState;

  BookmarkListReloadInitialStateSucceededAction({
    this.bookmarkListState
  });
}

class BookmarkListReloadInitialStateFailedAction { }

class BookmarkListLoadAction { }

class BookmarkListLoadSucceededAction {
  final List<BookmarkItem> bookmarkListItems;

  BookmarkListLoadSucceededAction({
    this.bookmarkListItems
  });
}

class BookmarkListLoadFailedAction {
  final String bookmarkListLoadError;

  BookmarkListLoadFailedAction({
    this.bookmarkListLoadError
  });
}

class BookmarkListActionItemPressedAction {
  final BuildContext context;
  final GeneratorWNP<Widget> bookmarkListOnGenerateChild;

  BookmarkListActionItemPressedAction({
    this.context,
    this.bookmarkListOnGenerateChild
  });
}

class BookmarkListActionChildItemPressedAction {
  final BuildContext context;
  final GeneratorWNP<Widget> bookmarkListOnGenerateChild;
  final ActionChildItemType bookmarkListActionChildItemType;
  final Object bookmarkListValue;

  BookmarkListActionChildItemPressedAction({
    this.context,
    this.bookmarkListOnGenerateChild,
    this.bookmarkListActionChildItemType,
    this.bookmarkListValue
  });
}

class BookmarkListItemTappedAction {
  final BuildContext context;
  final BookmarkItem bookmarkListTappedItem;

  BookmarkListItemTappedAction({
    this.context,
    this.bookmarkListTappedItem
  });
}
