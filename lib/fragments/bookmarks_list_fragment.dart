import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookmarksListFragment extends StatefulWidget {
  @override
  _BookmarksListFragmentState createState() => _BookmarksListFragmentState(); 
}

class _BookmarksListFragmentState extends State<BookmarksListFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitPulse(color: Colors.yellow)
            ],
          ),
        ],
      ),
    );
  }
}
