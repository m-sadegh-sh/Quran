import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

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
import 'package:quran/middlewares/about.middleware.dart';
import 'package:quran/middlewares/help_and_support.middleware.dart';
import 'actions/app.action.dart';

void main() async {
  Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = (details) => {
    Crashlytics.instance.recordFlutterError(details)
  };

  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _registerDependencies();

    final store = _createStore();

    store.dispatch(AppDiscoverPackageInfoAction());
    store.dispatch(SettingsLoadAction());

    runApp(StoreProvider(
      store: store,
      child: AppContainer()
    ));
  }, onError: (exception, stacktrace) => {
    Crashlytics.instance.recordError(exception, stacktrace)
  });
}

Future _registerDependencies() {
  final container = kiwi.Container();

  container.registerSingleton((c) => TranslatorRepository());
  container.registerSingleton((c) => ChapterRepository());
  container.registerSingleton((c) => ChapterTranslationRepository());
  container.registerSingleton((c) => VerseRepository());
  container.registerSingleton((c) => VerseTranslationRepository());

  return Future.wait([
    container.resolve<TranslatorRepository>().init(),
    container.resolve<ChapterRepository>().init(),
    container.resolve<ChapterTranslationRepository>().init(),
    container.resolve<VerseRepository>().init(),
    container.resolve<VerseTranslationRepository>().init()
  ]);
}

Store<RootState> _createStore() {
  final middlerwares = [
    ...createCommonMiddleware(),
    ...createAppMiddleware(),
    ...createSettingsMiddleware(),
    ...createHomeMiddleware(),
    ...createChapterListMiddleware(),
    ...createChapterDetailsMiddleware(),
    ...createHelpAndSupportMiddleware(),
    ...createAboutMiddleware()
  ];

  return new Store<RootState>(rootReducer,
      initialState: RootState.initial(),
      middleware: middlerwares
        ..add(new LoggingMiddleware.printer(level: Level.SHOUT))
  );
}
