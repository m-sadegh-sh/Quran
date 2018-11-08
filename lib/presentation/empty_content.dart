import 'package:flutter/material.dart';
import 'package:quran/app_localizations.dart';

class EmptyContent extends StatelessWidget {
  final String noResultMessage;

  EmptyContent({
    Key key,
    this.noResultMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.info_outline,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              margin: EdgeInsets.only(right: 5.0),
              child: Text(
                noResultMessage ?? AppLocalizations.of(context).translate('empty-content-no-result-message'),
                style: Theme.of(context).textTheme.subhead.apply(
                  color: Theme.of(context).hintColor
                )
              )
            )
          ]
        )
      )
    );
  }
}
