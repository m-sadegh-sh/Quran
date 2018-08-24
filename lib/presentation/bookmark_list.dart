import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookmarkList extends StatefulWidget {
  @override
  _BookmarkListState createState() => _BookmarkListState(); 
}

class _BookmarkListState extends State<BookmarkList> {
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
