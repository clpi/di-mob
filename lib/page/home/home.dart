import 'package:dimo/page/records/records.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/comp/sheet.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/comp/input.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/util.dart';
import '../records/record_router.dart';

class HomePage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomePage(),
  );
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  static String routeName = "Home";


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
      appBar: DlAppBar(key: Key("appBar"), title: "devisa").bar(context),
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   centerTitle: true,
      //   elevation: 10.0,
      //   title: Row(children: [
      //     Text("devisa", style: TextStyle(color: Colors.white, fontSize: 21.0),),
      //   ],
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   ),
      //   backgroundColor: Colors.deepPurpleAccent,
      //   actions: [
      //     // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
      //     IconButton(
      //       icon: Icon(Icons.my_library_add_rounded),
      //       onPressed: () => DlListSheet().show(context),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Home",
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.3,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),],),),),),
      bottomNavigationBar: DlBottomBar(restorationId: "", key: Key(""), type: BottomBarKind.Labels),
      endDrawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: DlFab(sheet: DlSheet()),
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

}

