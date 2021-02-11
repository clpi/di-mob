import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/comp/sheet.dart';

class DlFab extends StatelessWidget{

  final DlSheet sheet;

  DlFab({this.sheet}) : super();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        mini: false,
        autofocus: true,
        elevation: 4.0,
        isExtended: true,
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        foregroundColor: Theme.of(context).floatingActionButtonTheme.foregroundColor,
        onPressed: () { this.sheet.show(context); },
        tooltip: 'Increment',
        splashColor: Theme.of(context).splashColor,
        child: Icon(Icons.add),

    );
  }


}
