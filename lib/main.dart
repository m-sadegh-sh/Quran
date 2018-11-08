import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/reducers/root_reducer.dart';
import 'package:quran/containers/app_container.dart';
import 'package:quran/middlewares/chapter_list_middleware.dart';
import 'package:quran/middlewares/chapter_details_middleware.dart';

void main() async {
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