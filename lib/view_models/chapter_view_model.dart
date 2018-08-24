import 'package:redux/redux.dart';

import 'package:Quran/actions/chapter_list_action.dart';
import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/selectors/chapter_list_selector.dart';
import 'package:Quran/items/chapter_item.dart';

class ChapterListViewModel {
  final bool chapterListLoading;
  final bool chapterListLoadSucceeded;
  final List<ChapterItem> chapterList;
  final bool chapterListLoadFailed;
  final String chapterListLoadError;
  final Function(ChapterItem) onChapterItemTapped;

  ChapterListViewModel({
    this.chapterListLoading,
    this.chapterListLoadSucceeded,
    this.chapterList,
    this.chapterListLoadFailed,
    this.chapterListLoadError,
    this.onChapterItemTapped
  });

  static ChapterListViewModel fromStore(Store<ChapterListState> store) => ChapterListViewModel(
    chapterListLoading: chapterListLoadingSelector(store.state),
    chapterListLoadSucceeded: chapterListLoadSucceededSelector(store.state),
    chapterList: chapterListSelector(store.state),
    chapterListLoadFailed: chapterListLoadFailedSelector(store.state),
    chapterListLoadError: chapterListLoadErrorSelector(store.state),
    onChapterItemTapped: (ChapterItem chapterItem) {
      store.dispatch(ChapterItemTappedAction(
        chapterItem: chapterItem,
      ));
    }
  );
}
