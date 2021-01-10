import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';

class RecordsPage extends StatefulWidget {
  RecordsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          Text("Records"),
          MaterialButton(
            onPressed: () {},
          )
        ],
      ),
    ));
  }
}
