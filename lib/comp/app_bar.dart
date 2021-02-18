import 'package:flutter/material.dart';
import 'package:dimo/comp/sheet.dart';
import 'package:dimo/models/user/user.dart';

enum AppBarType {
  Tabbed,
  Untabbed,
}

class DlAppBar extends StatefulWidget {
  DlAppBar({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final User user;

  @override
  _DlAppBarState createState() => _DlAppBarState();

  static CircleAvatar userIcon() {
    return CircleAvatar(
      radius: 25.0,
      foregroundColor: Color(0xff2a282f),
      backgroundColor: Color(0xffB0Fe76),
      child: Icon(
        Icons.person_outline_rounded,
        size: 20.0,
      ),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      foregroundColor: Color(0xff2a282f),
      backgroundColor: Color(0xffB0Fe76),
      child: Icon(
        // Icons.calendar_today,
        Icons.more_vert,
        size: 20.0,
      ),
    );
  }

  PreferredSizeWidget bar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 10.0,
      // bottom: 
      // backgroundColor: Colors.black, // status bar color
      brightness: Brightness.dark, // status bar brightness
      // leading: userIcon(),
      // leadingWidth: 25,
      
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
      // backgroundColor: Theme.of(context).appBarTheme.color,
      actions: <Widget>[
        // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
        // IconButton(
        //   icon: calendarIcon(),
        //   onPressed: () => DlListSheet().show(context),
        //   enableFeedback: true,
        //   iconSize: 25.0,
        //   tooltip: "See your records",
        // ),
        IconButton(
          icon: userIcon(),
          onPressed: () => DlListSheet().show(context),
          enableFeedback: true,
          iconSize: 25.0,
          tooltip: 'user',
        )
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
