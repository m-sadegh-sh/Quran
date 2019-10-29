import 'package:redux/redux.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/chapter_list.action.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/repositories/chapter.repository.dart';
import 'package:quran/items/chapter.item.dart';

List<Middleware<RootState>> createChapterListMiddleware() {
  return [
    TypedMiddleware<RootState, ChapterListLoadAction>(_createChapterListLoad()),
    TypedMiddleware<RootState, ChapterListItemTappedAction>(_createChapterListItemTapped())
  ];
}

Middleware<RootState> _createChapterListLoad() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterListLoadAction;
      final chapterRepository = Container().resolve<ChapterRepository>();

      List<ChapterItem> chapterListItems;

      if (castedAction.homeSearchQuery?.isNotEmpty ?? false)
        chapterListItems = await chapterRepository.searchAllTranslated(
          castedAction.settingsTranslatorId,
          castedAction.homeSearchQuery
        );
      else
        chapterListItems = await chapterRepository.findAllTranslated(
          castedAction.settingsTranslatorId
        );

      store.dispatch(ChapterListLoadSucceededAction(
        chapterListItems: chapterListItems
      ));
    } catch(exception) {
      store.dispatch(ChapterListLoadFailedAction(
        chapterListLoadError: exception?.toString()
      ));
    }
  };
}

Middleware<RootState> _createChapterListItemTapped() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as ChapterListItemTappedAction;

      store.dispatch(ChapterDetailsLoadAction(
        context: action.context,
        chapterDetailsChapterItem: castedAction.chapterListTappedItem,
        settingsTranslatorId: castedAction.settingsTranslatorId,
        chapterDetailsNavigateToContainer: true
      ));
    } catch(exception) { }
  };
}