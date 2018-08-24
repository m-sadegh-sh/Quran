import 'package:flutter/material.dart';

class ListLoadError extends StatelessWidget {
  final String error;

  ListLoadError({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Theme.of(context).errorColor
        )
      )
    );
  }
}
