import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import 'package:dimo/screens/records/record_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'screens/home/home.dart';
import 'screens/records/records.dart';
import 'screens/user/user.dart';
import 'screens/prefs/prefs.dart';
import 'theme.dart';

class DlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showPerformanceOverlay: false,
        initialRoute: "Home",
        onGenerateRoute: (settings) {
          if (settings.name == HomePage.routeName) {
            // final ScreenArguments args = settings.arguments;
            return HomePage.route();
          } else if (settings.name == RecordsListPage.routeName) {
            return RecordsListPage.route();
          } else if (settings.name == UserPage.routeName) {
            return UserPage.route();
          } else if (settings.name == PrefsPage.routeName) {
            return PrefsPage.route();
          } else {
            return HomePage.route();
          }
          // The code only supports PassArgumentsScreen.routeName right now.
          // Other values need to be implemented if we add them. The assertion
          // here will help remind us of that higher up in the call stack, since
          // this assertion would otherwise fire somewhere in the framework.
        },
        title: 'div.is',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomePage(),
          "Records": (BuildContext context) => RecordsListPage(records: [], onTapped: (record) {}),
          "User": (BuildContext context) => UserPage(),
          "Preferences": (BuildContext context) => PrefsPage(),
        },
        theme: DlTheme.theme,
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey("Home"),
              child: HomePage(
                key: ValueKey("Home"),
                title: "Home",
              ),
            ),
            MaterialPage(
              key: ValueKey("Records"),
              child: RecordsListPage(records: [], onTapped: (record) {})
             ),
            MaterialPage(key: ValueKey("User"), child: UserPage()),
            MaterialPage(key: ValueKey("Preferences"), child: PrefsPage()),
            // MaterialPage(
            //   child: RecordsPage(key: ValueKey("Records"), title: "Records"),
            // )
          ],
          onPopPage: (route, res) => route.didPop(res),
        )
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
    primary: true,
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    bottomNavigationBar: bottomBar,
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
    endDrawerEnableOpenDragGesture: true,
    resizeToAvoidBottomInset: true,
    resizeToAvoidBottomPadding: true,
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButton: FloatingActionButton(
      autofocus: true,
      elevation: 4.0,
      isExtended: true,
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Increment',
      splashColor: Theme.of(context).splashColor,
      child: Icon(Icons.work),
    ), // This trailing comma makes auto-formatting nicer for build methods.
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