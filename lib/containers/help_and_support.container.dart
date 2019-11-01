import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/screens/help_and_support.screen.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/view_models/help_and_support.view_model.dart';

class HelpAndSupportContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, HelpAndSupportViewModel>(
      converter: HelpAndSupportViewModel.fromStore,
      builder: (BuildContext context, HelpAndSupportViewModel helpAndSupportViewModel) => HelpAndSupportScreen(
        helpAndSupportTitle: helpAndSupportViewModel.helpAndSupportOnGenerateTitle(context)
      )
    );
  }
}