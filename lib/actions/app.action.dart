
import 'package:quran/states/app.state.dart';

class AppReloadInitialStateAction { }

class AppReloadInitialStateSucceededAction {
  final AppState appState;

  AppReloadInitialStateSucceededAction({
    this.appState
  });
}

class AppReloadInitialStateFailedAction { }
