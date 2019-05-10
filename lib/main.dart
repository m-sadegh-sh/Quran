import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:kiwi/kiwi.dart' as wiki;

import 'package:quran/states/root_state.dart';
import 'actions/settings_action.dart';
import 'package:quran/reducers/root_reducer.dart';
import 'package:quran/middlewares/app_middleware.dart';
import 'package:quran/middlewares/settings_middleware.dart';
import 'package:quran/middlewares/home_middleware.dart';
import 'package:quran/middlewares/chapter_list_middleware.dart';
import 'package:quran/middlewares/chapter_details_middleware.dart';
import 'package:quran/containers/app_container.dart';
import 'data/translator_repository.dart';
import 'data/chapter_repository.dart';
import 'data/chapter_translation_repository.dart';
import 'data/verse_repository.dart';
import 'data/verse_translation_repository.dart';

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
    ]..addAll(createAppMiddleware())
    ..addAll(createSettingsMiddleware())
    ..addAll(createHomeMiddleware())
    ..addAll(createChapterListMiddleware())
    ..addAll(createChapterDetailsMiddleware())
  );
}