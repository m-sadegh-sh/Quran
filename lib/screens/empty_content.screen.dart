import 'package:flutter/material.dart';
import 'package:quran/app_localizations.dart';

class EmptyContentScreen extends StatelessWidget {
  final String noResultMessage;

  EmptyContentScreen({
    Key key,
    this.noResultMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5.0
              ),
              child: Text(
                noResultMessage ?? AppLocalizations.of(context).translate('empty-content-no-result-message'),
                style: Theme.of(context).textTheme.display3
              )
            )
          ]
        )
      )
    );
  }
}
