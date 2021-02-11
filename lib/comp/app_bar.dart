import 'package:flutter/material.dart';
import 'package:dimo/comp/sheet.dart';

enum AppBarType {
  Tabbed,
  Untabbed,
}

class DlAppBar extends StatefulWidget {
  DlAppBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DlAppBarState createState() => _DlAppBarState();

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.greenAccent,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  PreferredSizeWidget bar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 10.0,
      // bottom: TabBar(
      //   tabs: [
      //     Tab(icon: Icon(Icons.home)),
      //     Tab(icon: Icon(Icons.book)),
      //     Tab(icon: Icon(Icons.bar_chart_sharp)),
      //     Tab(icon: Icon(Icons.supervised_user_circle)),
      //   ],
      // ),
      title: Row(children: [
        Text(this.title, style: TextStyle(color: Colors.white, fontSize: 21.0),),
      ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Theme.of(context).appBarTheme.color,
      actions: [
        // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
        IconButton(
          icon: calendarIcon(),
          onPressed: () => DlListSheet().show(context),
        ),
      ],
    );
  }

}

class _DlAppBarState extends State<DlAppBar> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 10.0,
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.book)),
          Tab(icon: Icon(Icons.bar_chart_sharp)),
          Tab(icon: Icon(Icons.supervised_user_circle)),
        ],
      ),
      title: Row(children: [
        Text("devisa", style: TextStyle(color: Colors.white, fontSize: 21.0),),
      ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      actions: [
        // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
        IconButton(
          icon: Icon(Icons.my_library_add_rounded),
          onPressed: () => DlListSheet().show(context),
        ),
      ],

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
