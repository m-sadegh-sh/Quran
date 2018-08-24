import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:Quran/data/chapter_repository.dart';
import 'package:Quran/models/chapter_model.dart';

class ChaptersListFragment extends StatefulWidget {
  @override
  _ChaptersListFragmentState createState() => _ChaptersListFragmentState(); 
}

class _ChaptersListFragmentState extends State<ChaptersListFragment> {
  Widget _buildList(context, snapshot) {
    if (!snapshot.hasData)
      return Center(child: SpinKitPulse(color: Theme.of(context).primaryColor));

    if (snapshot.data.length == 0)
      return Text("No Data found");
    
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(snapshot.data[index].id.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            Text(snapshot.data[index].partNumber.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
            Divider()
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChapterModel>>(
      future: ChapterRepository().list(),
      builder: _buildList,
    );
  }
}
