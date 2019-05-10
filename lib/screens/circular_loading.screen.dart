import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:quran/app_localizations.dart';

class CircularLoadingScreen extends StatelessWidget {
  final String spinMessage;

  CircularLoadingScreen({
    Key key,
    this.spinMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitPulse(
          color: Theme.of(context).primaryColor,
          size: 64.0,
        ),
        Container(
          margin: EdgeInsets.only(
            top: 20.0
          ),
          child: Text(
            spinMessage ?? AppLocalizations.of(context).translate('circular-loading-spin-message'),
            style: Theme.of(context).textTheme.display3
          )
        )
      ]
    );
  }
}
