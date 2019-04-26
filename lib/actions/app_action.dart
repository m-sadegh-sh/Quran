
import 'package:quran/states/app_state.dart';

class AppReloadInitialStateAction { }

class AppReloadInitialStateSucceededAction {
  final AppState appState;

  AppReloadInitialStateSucceededAction({
    this.appState
  });
}

class AppReloadInitialStateFailedAction { }
