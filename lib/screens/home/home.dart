import 'package:animations/animations.dart';
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
import 'package:dimo/comp/bottom_bar.dart';

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
    final bottomBar = BottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
    return Scaffold(
      primary: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 10.0,
        title: Text(widget.title),
        //backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: Drawer(
        semanticLabel: "drawer",
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("chris"),
              currentAccountPicture: const CircleAvatar(
                child: FlutterLogo(size: 42.0),
              ),
              accountEmail: Text("clp@clp.is")),
          ListTile(
            title: Text("Profile"),
            leading: const Icon(Icons.supervised_user_circle),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Preferences"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]),
      ),
      bottomNavigationBar: bottomBar,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return RecordsPage(
              key: ValueKey("Records"),
              title: "Records",
            );
          }));
        },
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
