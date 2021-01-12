import 'package:flutter/material.dart';

enum AppBarType {
  Tabbed,
  Untabbed,
}

class DlAppBar extends StatefulWidget {
  DlAppBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DlAppBarState createState() => _DlAppBarState();

}

class _DlAppBarState extends State<DlAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 10.0,
      title: Text(widget.title),
      backgroundColor: Colors.deepPurpleAccent,
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.book)),
          Tab(icon: Icon(Icons.bar_chart_sharp)),
          Tab(icon: Icon(Icons.supervised_user_circle)),
        ],
      )

    );
 }
}