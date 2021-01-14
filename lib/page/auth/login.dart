import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/app_bar.dart';
import '../records/record_router.dart';

class LoginPage extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => LoginPage(),
  );
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  static String routeName = "Home";


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage>
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
        title: Row(children: [
          Icon(Icons.lightbulb_outline),
          Divider(indent: 5,),
          Text("div.is", style: TextStyle(color: Colors.white, fontSize: 21.0),),
        ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showSheet(context),
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
                        Row(children: [
                          Icon(Icons.lock_open),
                          Divider(indent: 5,),
                          Text(" login", textScaleFactor: 2.0,),

                        ],
                        mainAxisAlignment: MainAxisAlignment.center,

                        )
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
                              labelText: "E-mail",
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
                          ButtonBar(children: [
                            RaisedButton(onPressed: () {showAboutDialog(context: context);}, child: Text("Forgot?"),),
                            RaisedButton(onPressed: () { }, child: Text("Submit"),),
                          ],alignment: MainAxisAlignment.center,),
                          VerticalDivider(indent: 25.0,),
                          // DlCard(),
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
      ]
      ),
      bottomNavigationBar: DlBottomBar(restorationId: "", key: Key(""), type: BottomBarKind.Labels),
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
        onPressed: () { _showSheet(context); },
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
     showModalBottomSheet(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        // Using Wrap makes the bottom sheet height the height of the content.
        // Otherwise, the height will be half the height of the screen.
        return Wrap(
          clipBehavior: Clip.antiAlias,
          children: [
            ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              title: Text(
                'Create',
                style: theme.textTheme.headline5,
                textAlign: TextAlign.center,

              ),
              tileColor: Colors.deepPurpleAccent,
            ),
            ListTile(
              title: Text('New fact'),
              leading: Icon(Icons.add),
              subtitle: Text("Create a new fact entry", style: TextStyle(color: Colors.white54)),
              // trailing: Icon(Icons.menu_rounded)
            ),
            ListTile(
              title: Text('New item'),
              leading: Icon(Icons.lightbulb),
              subtitle: Text("Create a new item entry", style: TextStyle(color: Colors.white54)),
              // trailing: Icon(Icons.menu_rounded),
            ),
            ListTile(
              title: Text('New record'),
              leading: Icon(Icons.book),
              subtitle: Text("Create a new record", style: TextStyle(color: Colors.white54)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              // trailing: Icon(Icons.menu_rounded),
            ),
            ListTile(
              title: Text('New link'),
              leading: Icon(Icons.call_merge),
              subtitle: Text("Create a new link", style: TextStyle(color: Colors.white54)),
              trailing: Icon(Icons.menu_rounded),
            ),
          ],
        );
      },
    );

  }
}
