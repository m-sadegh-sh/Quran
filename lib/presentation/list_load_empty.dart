import 'package:flutter/material.dart';

class ListLoadEmpty extends StatelessWidget {
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
