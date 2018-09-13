import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String loadingMessage;

  EmptyContent({
    Key key,
    this.loadingMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'empty',
        style: TextStyle(
          color: Theme.of(context).disabledColor
        )
      )
    );
  }
}
