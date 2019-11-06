import 'package:redux/redux.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/common.action.dart';

List<Middleware<RootState>> createCommonMiddleware() {
  return [
    TypedMiddleware<RootState, CommonShareAction>(_createCommonShare())
  ];
}

Middleware<RootState> _createCommonShare() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    try {
      next(action);

      final castedAction = action as CommonShareAction;
   
      Share.text('', castedAction.commonContent, 'text/plain');
    } catch(exception) { }
  };
}
