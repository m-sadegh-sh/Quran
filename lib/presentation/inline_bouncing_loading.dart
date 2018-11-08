import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InlineBouncingLoading extends StatelessWidget {
  InlineBouncingLoading({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SpinKitThreeBounce(
          color: Theme.of(context).primaryColorLight,          
          size: 12.0
        )
      ]
    );
  }
}
