import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PartsListFragment extends StatefulWidget {
  @override
  _PartsListFragmentState createState() => _PartsListFragmentState(); 
}

class _PartsListFragmentState extends State<PartsListFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitPulse(color: Colors.pink)
            ],
          ),
        ],
      ),
    );
  }
}
