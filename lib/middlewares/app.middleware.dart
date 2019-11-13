import 'package:redux/redux.dart';

import 'package:quran/actions/app.action.dart';
import 'package:quran/states/root.state.dart';

List<Middleware<RootState>> createAppMiddleware() {
  return [
    TypedMiddleware<RootState, AppDiscoverPackageInfoAction>(_createAppDiscoverPackageInfo())
  ];
}

Middleware<RootState> _createAppDiscoverPackageInfo() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      store.dispatch(AppDiscoverPackageInfoSucceededAction(
        appId: 'ir.webplex.quran',
        appName: 'Quran',
        appVersionCode: 5,
        appVersionName: '1.0.4'
      ));
    } catch(exception) {
      store.dispatch(AppDiscoverPackageInfoFailedAction());
    }
  };
}
