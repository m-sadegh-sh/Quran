import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/reducers/root_reducer.dart';
import 'package:Quran/containers/app_container.dart';
import 'package:Quran/middlewares/chapter_middleware.dart';

void main() {
  final store = new Store<RootState>(
    rootReducer,
    initialState: RootState.initial(),
    middleware: []..addAll(createChapterListMiddleware())
  );

  runApp(
    StoreProvider(
      store: store,
      child: AppContainer()
    )
  );
}
