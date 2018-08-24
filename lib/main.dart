import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/app_state.dart';
import 'package:Quran/reducers/app_reducer.dart';
import 'package:Quran/containers/app_container.dart';

void main() {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial()
  );

  runApp(AppContainer(
    store: store,
  ));
}
