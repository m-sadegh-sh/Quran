import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/reducers/root_reducer.dart';
import 'package:quran/containers/app_container.dart';
import 'package:quran/middlewares/chapter_list_middleware.dart';
import 'package:quran/middlewares/chapter_details_middleware.dart';

void main() async {
  final persistor = _createPersistor();
  final store = _createStore(persistor);
  
  persistor.load(store);

  runApp(
    StoreProvider(
      store: store,
      child: PersistorGate(
        persistor: persistor,
        builder: (context) => AppContainer()
      )
    )
  );
}

Persistor<RootState> _createPersistor() {
  return Persistor<RootState>(
    version: 1,
    storage: FlutterStorage(
      "quran",
      location: FlutterSaveLocation.sharedPreferences
    ),
    
  );
}

Store<RootState> _createStore(Persistor<RootState> persistor) {
  return new Store<RootState>(
    rootReducer,
    initialState: RootState.initial(),
    middleware: [
      persistor.createMiddleware(),
      new LoggingMiddleware.printer(level: Level.SHOUT)
    ]..addAll(createChapterListMiddleware())
    ..addAll(createChapterDetailsMiddleware())
  );
}