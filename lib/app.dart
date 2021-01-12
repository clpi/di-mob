import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:dimo/router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/screens/records/records.dart';
import 'package:dimo/screens/prefs/prefs.dart';
import 'package:dimo/screens/user/user.dart';
import 'package:get/route_manager.dart';
import 'package:dimo/screens/home/home.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/screens/records/record_router.dart';
import 'package:dimo/screens/home/home.dart';
import 'package:dimo/screens/records/records.dart';

class DlApp extends StatefulWidget {
  DlApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DlAppState createState() => _DlAppState();
}

class _DlAppState extends State<DlApp>
    with SingleTickerProviderStateMixin {
  RecordRouterDelegate _routerDelegate = RecordRouterDelegate();
  TabController controller;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBar = DlBottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
    final dlDrawer = DlDrawer(key: Key("drawer"));
    final dlAppBar = DlAppBar(key: Key("appBar"), title: "div.is");
    return Scaffold(
      primary: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: bottomBar,
      drawer: dlDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 10.0,
        title: Text("div.is", style: TextStyle(color: Colors.white, fontSize: 21.0),),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(icon: Icon(Icons.list_alt), onPressed: () {},)
        ],
      ),
      extendBodyBehindAppBar: false,
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          HomePage(),
          RecordsListPage(key: Key("recordsListPage"), records: [], onTapped: (record) {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        autofocus: true,
        elevation: 4.0,
        isExtended: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () {},
        tooltip: 'Increment',
        splashColor: Colors.purpleAccent,
        child: Icon(Icons.note_add_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  } 
}
