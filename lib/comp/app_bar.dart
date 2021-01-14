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

class DlSliver extends State<DlAppBar> {
  bool _pinned = true;
  bool _snap = true;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: this._pinned,
              snap: this._snap,
              floating: this._floating,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(this.widget.title),
              ),
          )
        ]
    );
  }
}
