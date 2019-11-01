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

  Widget _createLeadingText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.display2.apply(
        color: Theme.of(context).primaryColor
      )
    );
  }

  Widget _createTrailingText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.display2.apply(
        fontWeightDelta: 2,
        color: Theme.of(context).primaryColor
      )
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _createLeadingText(
          context,
          AppLocalizations.of(context).translate('about-investment-leading'),
        ),
        _createTrailingText(
          context,
          AppLocalizations.of(context).translate('about-investment-trailing')
        ),
        _createLeadingText(
          context,
          AppLocalizations.of(context).translate('about-development-leading'),
        ),
        _createTrailingText(
          context,
          AppLocalizations.of(context).translate('about-development-trailing')
        ),
        Text(
          AppLocalizations.of(context).translate('about-version'),
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          AppLocalizations.of(context).translate('about-release-date'),
          style: Theme.of(context).textTheme.title,
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context)
    );
  }
}
