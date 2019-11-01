import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/screens/about.screen.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/view_models/about.view_model.dart';

class AboutContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, AboutViewModel>(
      converter: AboutViewModel.fromStore,
      builder: (BuildContext context, AboutViewModel aboutViewModel) => AboutScreen(
        aboutTitle: aboutViewModel.aboutOnGenerateTitle(context)
      )
    );
  }
}