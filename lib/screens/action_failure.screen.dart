import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';

class ActionFailureScreen extends StatelessWidget {
  final String errorMessage;
  final Function onRetryActionPressed;

  ActionFailureScreen({
    Key key,
    this.errorMessage,
    this.onRetryActionPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  size: 40.0,
                  color: Theme.of(context).errorColor,
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: Text(
                    errorMessage ?? AppLocalizations.of(context).translate('action-failure-error-message'),
                    style: Theme.of(context).textTheme.display3
                  )
                )
              ]
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20.0
              ),
              child: RaisedButton(
                color: Theme.of(context).canvasColor,
                padding: EdgeInsets.all(15.0),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor
                  )
                ),
                child: Icon(
                  Icons.refresh,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: onRetryActionPressed,
              )
            )
          ]
        )
      )
    );
  }
}
