import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:quran/app_localizations.dart';

class AboutScreen extends StatelessWidget {  
  final String appVersionName;
  final String aboutTitle;
  final String aboutBackgroundImage;
  
  AboutScreen({
    Key key,
    this.appVersionName,
    this.aboutTitle,
    this.aboutBackgroundImage
  }) : super(key: key);

  Widget _buildFlexibleSpaceTitle(BuildContext context) {
    return SizedBox(
      height: kTextTabBarHeight,
      child: Text(
        aboutTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.overline
      )
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.all(0),
      centerTitle: true,
      title: _buildFlexibleSpaceTitle(context),
      background: Image.asset(
          aboutBackgroundImage,
          fit: BoxFit.cover,
      )
    );
  }

  List<Widget> _buildHeaderSliver(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 200.0,
        pinned: true,
        floating: true,
        snap: true,
        titleSpacing: 0,
        flexibleSpace: _buildFlexibleSpace(context)
      ),
    ];
  }

  Widget _createLeadingText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.display3
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
    return Container(
      color: Theme.of(context).buttonColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: const EdgeInsets.only(
              bottom: 10.0
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _createLeadingText(
                    context,
                    AppLocalizations.of(context).translate('about-investment-leading'),
                  ),
                  _createTrailingText(
                    context,
                    AppLocalizations.of(context).translate('about-investment-trailing')
                  )
                ]
              )
            ),
          ),
          Card(
            margin: const EdgeInsets.only(
              bottom: 10.0
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _createLeadingText(
                    context,
                    AppLocalizations.of(context).translate('about-development-leading'),
                  ),
                  _createTrailingText(
                    context,
                    AppLocalizations.of(context).translate('about-development-trailing')
                  )
                ]
              )
            )
          ),
          Card(
            margin: const EdgeInsets.only(
              bottom: 10.0
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _createLeadingText(
                    context,
                    AppLocalizations.of(context).translate('about-source-leading'),
                  ),
                  Linkify(
                    onOpen: (link) async {
                      await launch('http://tanzil.net');
                    },
                    humanize: true,
                    text: AppLocalizations.of(context).translate('about-source-trailing'),
                    style: Theme.of(context).textTheme.display2.apply(
                      fontWeightDelta: 2,
                      color: Theme.of(context).primaryColor
                    ),
                    linkStyle: Theme.of(context).textTheme.display2.apply(
                      fontWeightDelta: 2,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline
                    )
                  )
                ]
              )
            )
          ),
          Center(
            child:Column(
              children: [
                Text(
                  AppLocalizations.of(context).translateFormatted('about-version', { 'versionName': appVersionName }),
                  style: Theme.of(context).textTheme.display3,
                ),
                Text(
                  AppLocalizations.of(context).translate('about-release-date'),
                  style: Theme.of(context).textTheme.display3,
                )
              ])
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: _buildHeaderSliver,
      body: _buildBody(context),
    );
  }
}
