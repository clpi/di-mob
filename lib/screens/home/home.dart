import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:dimo/router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import '../records/records.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/screens/records/records.dart';
import 'package:dimo/screens/prefs/prefs.dart';
import 'package:dimo/screens/user/user.dart';
import 'package:get/route_manager.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  RecRouterDelegate _routerDelegate = RecRouterDelegate();
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
    return Scaffold(
      endDrawer: Container(
        child: Text("end"),
      ),
      endDrawerEnableOpenDragGesture: true,
      primary: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 10.0,

        title: Text(widget.title),
        //backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: Drawer(
        semanticLabel: "drawer",
        child: Column(children: <Widget>[
          CupertinoActionSheet(
            title: Text("FDSF"),
            message: Text("fdsf"),
          ),
          UserAccountsDrawerHeader(
              accountName: Text("chris"), accountEmail: Text("clp@clp.is")),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.0,
        type: BottomNavigationBarType.shifting,
        elevation: 2.0,
        onTap: (idx) {},
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        unselectedLabelStyle: TextStyle(
          color: Colors.white54,
        ),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Records",
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_rounded),
            activeIcon: Icon(Icons.person_outline_rounded),
          ),
          BottomNavigationBarItem(
            label: "Prefs",
            icon: Icon(Icons.settings_rounded),
            activeIcon: Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return RecordsPage(
              key: ValueKey("Records"),
              title: "Records",
            );
          }));
        },
        child: Container(
          child: Hero(
              tag: "mainHero",
              child: Column(
                children: <Widget>[
                  Row(
                    children: [],
                  ),
                  Card(
                    elevation: 0.4,
                    color: Colors.black12,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                          child: Column(children: [
                        Text(
                          "Card",
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
        ),
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
