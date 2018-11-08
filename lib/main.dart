import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/reducers/root_reducer.dart';
import 'package:Quran/containers/app_container.dart';
import 'package:Quran/middlewares/chapter_list_middleware.dart';
import 'package:Quran/middlewares/chapter_details_middleware.dart';
import 'package:Quran/data/translator_repository.dart';
import 'package:Quran/data/chapter_repository.dart';
import 'package:Quran/data/chapter_translation_repository.dart';
import 'package:Quran/data/verse_repository.dart';
import 'package:Quran/data/verse_translation_repository.dart';

void main() async {
  await TranslatorRepository().init();
  await ChapterRepository().init();
  await ChapterTranslationRepository().init();
  await VerseRepository().init();
  await VerseTranslationRepository().init();
  
  final store = new Store<RootState>(
    rootReducer,
    initialState: RootState.initial(),
    middleware: [
      new LoggingMiddleware.printer(level: Level.SHOUT)
    ]..addAll(createChapterListMiddleware())
     ..addAll(createChapterDetailsMiddleware())
  );

  runApp(
    StoreProvider(
      store: store,
      child: AppContainer()
    )
  );
}