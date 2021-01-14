import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/comp/sheet.dart';

class DlFab extends StatefulWidget{

  final DlSheet sheet;

  DlFab({key: Key, this.sheet}) : super(key: key);


  @override
  _DlFabState createState() => _DlFabState();

  void show(BuildContext context) {
  }


}

class _DlFabState extends State<DlFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        mini: false,
        autofocus: true,
        elevation: 4.0,
        isExtended: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () { this.widget.sheet.show(context); },
        tooltip: 'Increment',
        splashColor: Theme.of(context).splashColor,
        child: Icon(Icons.add),

    );

  }

}
