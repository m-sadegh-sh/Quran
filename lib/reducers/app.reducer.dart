import 'package:redux/redux.dart';

import 'package:quran/states/app.state.dart';
import 'package:quran/actions/app.action.dart';

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AppDiscoverPackageInfoSucceededAction>(_appDiscoverPackageInfoSucceeded)
]);

AppState _appDiscoverPackageInfoSucceeded(AppState state, AppDiscoverPackageInfoSucceededAction action) {
  return state.copyWith(
    appId: action.appId,
    appName: action.appName,
    appVersionCode: action.appVersionCode,
    appVersionName: action.appVersionName
  );
}
