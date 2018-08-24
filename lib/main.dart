import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:Quran/states/app_state.dart';
import 'package:Quran/reducers/app_reducer.dart';
import 'package:Quran/app.dart';

void main() {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );

  runApp(QuranApp(
    store: store,
  ));
}
