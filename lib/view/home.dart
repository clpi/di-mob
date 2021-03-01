import 'package:dimo/view/home/records.dart';
import 'package:dimo/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/app.dart';
import 'package:dimo/view/home/dash.dart';
import 'package:dimo/view/home/records.dart';
import 'package:dimo/view/home/user.dart';
import 'package:dimo/view/home/community.dart';
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

class HomeView extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomeView(),
  );

  HomeView({Key key}) : super(key: key);
  final List<Widget> pages = <Widget>[
      HomeDashPage(key: Key("devisa")),
      HomeRecordsPage(key: Key("records"), onTapped: (context) {}, records: []),
      HomeCommunityPage(key: Key("community")),
      HomeUserPage(key: Key("User")),
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {

  TabController controller;

  int _currentIndex;
  String _title = "devisa";

  @override
  void initState() {
    super.initState();
    _title = "devisa";
    _currentIndex = 0;
    controller = TabController(
      length: 4, 
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

   void _toggleTab() {
  }

  @override
  Widget build(BuildContext context) {
    final dlBottom = DlBottomBar(currentIndex: _currentIndex, key: Key(""), type: BottomBarKind.Labels);
    final dlDrawer = DlDrawer(key: Key("drawer"));
    final dlFab = DlFab(sheet: DlSheet());
    final dlAppBar = DlAppBar(key: Key("appBar"), title: _title).bar(context);
    var items = [
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
            label: "Community",
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group_rounded),
          ),
          BottomNavigationBarItem(
            label: "You",
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
          ),
    ];

    // return DefaultTabController(
    //   length: 4,
    //   initialIndex: 0,
      return Scaffold(
        primary: true,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        drawer: dlDrawer,
        appBar: dlAppBar,
        body: TabBarView(
          children: this.widget.pages, 
          controller: controller, 
          physics: NeverScrollableScrollPhysics(),
          // dragStartBehavior: DragStartBehavior.down,
        ),
          // children: [
          //   for (final page in this.widget.pages) page
          // ],
        // ),
      // body: Navigator(
      //   pages: [
      //     for (final page in this.widget.pages) MaterialPage(child: page)
      //   ],
      //   onPopPage: (route, res) => route.didPop(res),
      // ),
        // bottomNavigationBar: dlBottom,
        // endDrawerEnableOpenDragGesture: true,
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: dlFab,
        drawerEnableOpenDragGesture: true,
        // bottomNavigationBar: BottomAppBar(
        //   child: Row(

        //   ),
        //   items: items,
        //   showSelectedLabels: true,
        //   showUnselectedLabels: false,
        //   currentIndex: _currentIndex,
        //   selectedFontSize: 12,
        //   iconSize: 20.0,
        //   type: BottomNavigationBarType.fixed,
        //   elevation: 3.0,
        //   onTap: (int idx) { setState(() { _currentIndex = idx; }); }
        //   // selectedItemColor: colorScheme.onPrimary,
        //   // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        //   // backgroundColor: Colors.black
        // )
        // bottomNavigationBar: new BottomAppBar(
        //   child: TabBar(
        //     controller: this.controller,
        //     tabs: [for (final page in this.widget.pages) Tab(child: page)],
        //   )
        // ),
        bottomNavigationBar: new BottomNavigationBar(
          items: items,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: controller.index,
          selectedFontSize: 12,
          iconSize: 20.0,
          type: BottomNavigationBarType.fixed,
          elevation: 3.0,
          onTap: (int idx) { 
            setState(() { 
              this._currentIndex = idx; 
              this.controller.animateTo(idx);
            }); 
          }
          // selectedItemColor: colorScheme.onPrimary,
          // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
          // backgroundColor: Colors.black
        )
      );
  }
}
