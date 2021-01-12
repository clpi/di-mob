import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:dimo/router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../records/records.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/screens/records/records.dart';
import 'package:dimo/screens/prefs/prefs.dart';
import 'package:dimo/screens/user/user.dart';
import 'package:get/route_manager.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/screens/records/record_router.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  RecordRouterDelegate _routerDelegate = RecordRouterDelegate();
  TabController controller;

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
        title: Text("div.is"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(icon: Icon(Icons.list_alt), onPressed: () {},)
        ],
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        child: Center(
          child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation
               );
            },
            child: Hero(
              tag: "mainHero",
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0.4,
                    color: Colors.black12,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                          child: Column(children: [
                        Text(
                          "c0rd",
                          textScaleFactor: 2.0,
                        ),
                        Text("subtitle"),
                      ])),
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    borderOnForeground: true,
                    margin: EdgeInsets.all(20.0),
                  ),
                ],
              )),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        foregroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        tooltip: 'Increment',
        splashColor: Colors.deepPurpleAccent,
        child: Icon(Icons.note_add_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  } 
}
