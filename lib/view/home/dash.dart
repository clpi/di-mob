import 'package:dimo/view/home/records.dart';
import 'package:dimo/theme.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/app.dart';
import 'package:dimo/comp/sheet.dart';
import 'package:dimo/comp/record_card.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/comp/input.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/util.dart';

import '../records/record_router.dart';

class HomeDashPage extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomeDashPage(),
  );

  HomeDashPage({Key key, this.title}) : super(key: key);
  final String title;
  static String routeName = "Home";


  @override
  _HomeDashPageState createState() => _HomeDashPageState();
}

class _HomeDashPageState extends State<HomeDashPage>
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
  void testFunction() {

  }


  @override
  Widget build(BuildContext context) {
    final body = _body(context);

    return body;
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
              child: Column(
                children: [
                  // sectionHeader("Dashboard", Icons.dashboard_rounded),
                  // section(),
                  sectionHeader("Records", Icons.book_outlined, "Your records"),
                  RecordCard(name: "Sample Record", desc: "A sample record", items: ["Item 1", "Item 2"]),
                  RecordCard(name: "Record 2", desc: "Another sample record", items: ["Item 1", "Item 2"]),
                  section(),
                  sectionHeader("Items", Icons.emoji_objects_outlined, "Your items"),
                  RecordCard(name: "Item 1", desc: "A sample record", items: ["Item 1", "Item 2"]),
                  RecordCard(name: "Item 2", desc: "A sample record", items: ["Item 1", "Item 2"]),
                  section(),
                  sectionHeader("Stats", Icons.bar_chart_outlined, "Your stats"),
                  RecordCard(name: "Record 1", desc: "A sample record", items: ["Item 1", "Item 2"]),
                  section(),
                  sectionHeader("Profile", Icons.person_outline, "Your profile"),
                  section(),
                  sectionHeader("Facts", Icons.note, "Your facts"),
                  section(),
                ],
              )
              )
          )
        )
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

  Widget sectionHeader(String title, IconData icon, String link) {

    return Container(
      // width: 100,
      decoration: BoxDecoration(
        // color: Color(0xff3a383f),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(10,0,10,0),
      child: ListTile(
        leading: Icon(icon),
        trailing: FlatButton(child: Text(link, style: TextStyle(color: DlPalette.green)), onPressed: () {},),
          // Icon(icon, size: 32),
          // Divider(indent: 20),
        title: Text(title, style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontSize: 18.0)),
        // subtitle: Text("Record feed", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white38)),
      )
    );
  }

  Widget section() {
    return Column(
      children: [],
    );

  }

}

Widget _layout(BuildContext context, Widget body) {
  final dlBottom = DlBottomBar(currentIndex: 0, key: Key(""), type: BottomBarKind.Labels);
  final dlDrawer = DlDrawer(key: Key("drawer"));
  final dlFab = DlFab(sheet: DlSheet());
  final dlAppBar = DlAppBar(key: Key("appBar"), title: "devisa").bar(context);
  return Scaffold(
    primary: true,
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    drawer: dlDrawer,
    appBar: dlAppBar,
    body: body,
    bottomNavigationBar: dlBottom,
    endDrawerEnableOpenDragGesture: true,
    resizeToAvoidBottomInset: true,
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButton: dlFab,
    drawerEnableOpenDragGesture: true,
  );
}
