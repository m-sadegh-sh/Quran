import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SurahsListFragment extends StatefulWidget {
  @override
  _SurahsListFragmentState createState() => _SurahsListFragmentState(); 
}

class _SurahsListFragmentState extends State<SurahsListFragment> {
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
