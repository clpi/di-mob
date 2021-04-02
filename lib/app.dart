import 'package:flutter/cupertino.dart';

import 'comp/app_bar.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/sheet.dart';

import 'package:dimo/view/auth/login.dart';
import 'package:dimo/view/auth/signup.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:dimo/view/prefs/prefs.dart';

import 'package:dimo/view/home.dart';
import 'package:dimo/view/home/dash.dart';
import 'package:dimo/view/home/user.dart';
import 'package:dimo/view/home/community.dart';
import 'package:dimo/view/home/records.dart';

import 'package:dimo/models/record/record.dart';

import 'theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';


class DlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        showPerformanceOverlay: false,
        initialRoute: "Login",
        onGenerateRoute: _onGenerateRoute,
        title: 'd',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomeView(),
          "Dash": (BuildContext context) => HomeDashPage(),
          "Records": (BuildContext context) => HomeRecordsPage(records: [], onTapped: (record) {}),
          "User": (BuildContext context) => HomeUserPage(),
          "Community": (BuildContext context) => HomeCommunityPage(),
          "Preferences": (BuildContext context) => PrefsPage(),
          "Login": (BuildContext context) => LoginPage(),
          "Signup": (BuildContext context) => SignupPage(),
        },
        theme: DlTheme.dark,
        home: LoginPage(),
        // home: Navigator(
        //   pages: [
        //     MaterialPage(
        //       key: ValueKey("Home"),
        //       child: HomePage(
        //         key: ValueKey("Home"),
        //         title: "Home",
        //       ),
        //     ),
        //     MaterialPage(
        //       key: ValueKey("Records"),
        //       child: RecordsListPage(records: [], onTapped: (record) {})
        //      ),
        //     MaterialPage(key: ValueKey("User"), child: UserPage()),
        //     MaterialPage(key: ValueKey("Preferences"), child: PrefsPage()),
        //     MaterialPage(key: ValueKey("Login"), child: LoginPage()),
        //     MaterialPage(key: ValueKey("Signup"), child: SignupPage()),
        //     // MaterialPage(
        //     //   child: RecordsPage(key: ValueKey("Records"), title: "Records"),
        //     // )
        //   ],
        //   onPopPage: (route, res) => route.didPop(res),
        // )
        // home: MyHomePage(title: 'div.is'),
      );
  }
}

class DlAppScaffold extends StatefulWidget {
  DlAppScaffold({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DlAppScaffoldState createState() => _DlAppScaffoldState();

}

class _DlAppScaffoldState extends State<DlAppScaffold> {

  int _index = 0;
  PageController _controller;


  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: PageView(
      controller: _controller,
      children: [
        HomeDashPage(),
        HomeRecordsPage(records: [], onTapped: (record) {}),
        HomeUserPage(),
        HomeCommunityPage()
      ],
    )
  );
}
  void _newFact(BuildContext context) {
    showAboutDialog(context: context);
  }

  void _viewRecords(BuildContext context) {
  }
}


Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomeDashPage();
      });
    case "/records":
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomeRecordsPage(records: [], onTapped: (record) {},);
      });
    case "/user":
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomeUserPage();
      });
    case "/community":
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomeCommunityPage();
      });
    case "/prefs":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PrefsPage();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
  }
}

Widget _appLayout(BuildContext context) {
  final dlBottom = DlBottomBar(currentIndex: 0, key: Key(""), type: BottomBarKind.Labels);
  final dlDrawer = DlDrawer(key: Key("drawer"));
  final dlFab = DlFab(sheet: DlSheet());
  final dlAppBar = DlAppBar(key: Key("appBar"), title: "devisa").bar(context);
  return Scaffold(
    primary: true,
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    drawer: dlDrawer,
    appBar: dlAppBar,
    bottomNavigationBar: dlBottom,
    endDrawerEnableOpenDragGesture: true,
    resizeToAvoidBottomInset: true,
    resizeToAvoidBottomPadding: true,
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButton: dlFab,
    drawerEnableOpenDragGesture: true,
  );
}