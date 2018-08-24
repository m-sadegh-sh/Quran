import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitPulse(color: Theme.of(context).primaryColor));
  }
}
