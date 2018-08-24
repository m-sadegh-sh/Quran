import 'package:Quran/states/app_state.dart';
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

  static ChapterListViewModel fromStore(Store<AppState> store) {
    final chapterListState = chapterListStateSelector(store.state);

    return ChapterListViewModel(
      chapterListLoading: chapterListLoadingSelector(chapterListState),
      chapterListLoadSucceeded: chapterListLoadSucceededSelector(chapterListState),
      chapterList: chapterListSelector(chapterListState),
      chapterListLoadFailed: chapterListLoadFailedSelector(chapterListState),
      chapterListLoadError: chapterListLoadErrorSelector(chapterListState),
      onChapterItemTapped: (ChapterItem chapterItem) {
        store.dispatch(ChapterListItemTappedAction(
          chapterItem: chapterItem,
        ));
      }
    );
  }
}
