import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:dimo/comp/timeline.dart';

class HomePage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomePage(),
  );
  HomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  RecordRouterDelegate _routerDelegate = RecordRouterDelegate();
  TabController controller;

  int _index = 0;


  @override
  void initState() {
    super.initState();
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
      drawer: dlDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 10.0,
        title: Text(".is", style: TextStyle(color: Colors.white, fontSize: 21.0),),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _newFact(context),
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
      body: IndexedStack(
        index: _index,
        children: <Widget>[Container(
        child: Center(
          child: Column(
            children: [
              Hero(
              tag: "mainHero",
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                        Text("div.is", textScaleFactor: 2.0,),
                        Text("login", textScaleFactor: 1.1),
                    ],),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Username",
                              hintText: 'Your username',
                            )
                          ),
                          TextField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: 'Your password',
                            ),
                          ),
                          VerticalDivider(indent: 25.0,),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.center, 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(onPressed: () {showAboutDialog(context: context);}, child: Text("Forgot?"),),
                              Divider(thickness: 2.0,indent: 20.0,),
                              RaisedButton(onPressed: () { }, child: Text("Submit"),),
                            ],
                          )
                        ]
                      )

                    ),
                  ),
                ],
              )
              ),
            ],
        )),
      ),
      Text("page 2") ,
      Text("page 3"),
      ]
      ),
      bottomNavigationBar: bottomBar,
      endDrawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        mini: false,
        autofocus: true,
        elevation: 4.0,
        isExtended: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () {},
        tooltip: 'Increment',
        splashColor: Theme.of(context).splashColor,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  } 

  void _newFact(BuildContext context) {
    showAboutDialog(context: context);
  }

  void _viewRecords(BuildContext context) {
    showModal(context: context, builder: (BuildContext context) {
      return Column(
        children: [
          Text("Hello!"),
          MaterialButton(onPressed: () {}),
        ],
       );
    });
  }

  void _showSheet(BuildContext context) {

  }
}
