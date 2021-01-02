import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';

class PrefsPage extends StatefulWidget {
  PrefsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PrefsPageState createState() => _PrefsPageState();
}

class _PrefsPageState extends State<PrefsPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Prefs"),
              MaterialButton(
                onPressed: () { },
              )
            ],
          ),
        )
    );
  }
}
