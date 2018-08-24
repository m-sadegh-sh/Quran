import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PartList extends StatefulWidget {
  @override
  _PartListState createState() => _PartListState(); 
}

class _PartListState extends State<PartList> {
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
