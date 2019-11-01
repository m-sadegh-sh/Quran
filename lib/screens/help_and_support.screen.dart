import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';

class HelpAndSupportScreen extends StatelessWidget {  
  final String helpAndSupportTitle;
  
  HelpAndSupportScreen({
    Key key,
    this.helpAndSupportTitle
  }) : super(key: key);

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        helpAndSupportTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline
      )
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView(
      children: [
        Text(
          AppLocalizations.of(context).translate('help-and-support-'),
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildListView(context)
    );
  }
}
