import 'package:Quran/app_localizations.dart';
import 'package:flutter/material.dart';

class ActionFailure extends StatelessWidget {
  final String errorMessage;
  final Function onRetryActionPressed;

  ActionFailure({
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
                  Icons.error,
                  size: 40.0,
                  color: Theme.of(context).errorColor,
                ),
                Text(
                  errorMessage ?? AppLocalizations.of(context).translate('action-failure-error-message'),
                  style: Theme.of(context).textTheme.subhead
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
                shape: CircleBorder(
                  side: BorderSide(
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
