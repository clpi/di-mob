import 'comp/app_bar.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/sheet.dart';
import 'page/records/record_router.dart';
import 'package:dimo/page/auth/login.dart';
import 'package:dimo/page/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'page/home/home.dart';
import 'page/auth/login.dart';
import 'page/records/records.dart';
import 'page/user/user.dart';
import 'page/prefs/prefs.dart';
import 'theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:google_fonts/google_fonts.dart';


class DlApp extends StatelessWidget {
  // This widget is the root of your application.

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        showPerformanceOverlay: false,
        initialRoute: "/authenticate",
        onGenerateRoute: _onGenerateRoute,
        title: 'div.is',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomePage(),
          "Records": (BuildContext context) => RecordsListPage(records: [], onTapped: (record) {}),
          "User": (BuildContext context) => UserPage(),
          "Preferences": (BuildContext context) => PrefsPage(),
          "Login": (BuildContext context) => LoginPage(),
          "Signup": (BuildContext context) => SignupPage(),
        },
        theme: DlTheme.theme,
        home: Scaffold(
        ),
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
  final bottomBar = DlBottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
  final dlDrawer = DlDrawer(key: Key("drawer"));
  return Scaffold(
    body: PageView(
      controller: _controller,
      children: [
        HomePage(),
        RecordsListPage(records: [], onTapped: (record) {}),
        UserPage(),
        PrefsPage()
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
        return HomePage();
      });
    case "/records":
      return MaterialPageRoute(builder: (BuildContext context) {
        return RecordsListPage(records: [], onTapped: (record) {},);
      });
    case "/user":
      return MaterialPageRoute(builder: (BuildContext context) {
        return UserPage();
      });
    case "/prefs":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PrefsPage();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      });
  }
}

Widget _appLayout(BuildContext context) {
  final dlBottom = DlBottomBar(restorationId: "", key: Key(""), type: BottomBarKind.Labels);
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