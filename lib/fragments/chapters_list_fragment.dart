import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChaptersListFragment extends StatefulWidget {
  @override
  _ChaptersListFragmentState createState() => _ChaptersListFragmentState(); 
}

class _ChaptersListFragmentState extends State<ChaptersListFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitPulse(color: Colors.teal)
            ],
          ),
        ],
      ),
    );
  }
}
