import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';

class AboutScreen extends StatelessWidget {  
  final String aboutTitle;
  
  AboutScreen({
    Key key,
    this.aboutTitle
  }) : super(key: key);

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        aboutTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline
      )
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView(
      children: [
        Text(
          AppLocalizations.of(context).translate('about-'),
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
