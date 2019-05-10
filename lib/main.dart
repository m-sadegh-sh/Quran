import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:kiwi/kiwi.dart' as wiki;

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/reducers/root.reducer.dart';
import 'package:quran/middlewares/common.middleware.dart';
import 'package:quran/middlewares/app.middleware.dart';
import 'package:quran/middlewares/settings.middleware.dart';
import 'package:quran/middlewares/home.middleware.dart';
import 'package:quran/middlewares/chapter_list.middleware.dart';
import 'package:quran/middlewares/chapter_details.middleware.dart';
import 'package:quran/containers/app.container.dart';
import 'package:quran/repositories/translator.repository.dart';
import 'package:quran/repositories/chapter.repository.dart';
import 'package:quran/repositories/chapter_translation.repository.dart';
import 'package:quran/repositories/verse.repository.dart';
import 'package:quran/repositories/verse_translation.repository.dart';

void main() {
  registerDependencies();
  
  final store = _createStore();

  store.dispatch(SettingsSharedPreferencesLoadAction());

  runApp(
    StoreProvider(
      store: store,
      child: AppContainer()
    )
  );
}

void registerDependencies() {
  var container = wiki.Container();

  container.registerSingleton((c) => TranslatorRepository());
  container.registerSingleton((c) => ChapterRepository());
  container.registerSingleton((c) => ChapterTranslationRepository());
  container.registerSingleton((c) => VerseRepository());
  container.registerSingleton((c) => VerseTranslationRepository());
}

Store<RootState> _createStore() {  
  return new Store<RootState>(
    rootReducer,
    initialState: RootState.initial(),
    middleware: [
      new LoggingMiddleware.printer(level: Level.SHOUT)
    ]..addAll(createCommonMiddleware())
    ..addAll(createAppMiddleware())
    ..addAll(createSettingsMiddleware())
    ..addAll(createHomeMiddleware())
    ..addAll(createChapterListMiddleware())
    ..addAll(createChapterDetailsMiddleware())
  );
}