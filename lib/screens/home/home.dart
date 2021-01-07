import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/screens/records/records.dart';
import 'package:dimo/screens/prefs/prefs.dart';
import 'package:dimo/screens/user/user.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

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
      drawerScrimColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        actions: [
        ],

        title: Text(widget.title),
        //backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: CircleAvatar())
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 2.0,
        backgroundColor: Colors.black26,
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
          )
        ],
      ),
      body: Container(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
              ],
            )
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        tooltip: 'Increment',
        splashColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _TransitionListTile extends StatelessWidget {
  const _TransitionListTile({
    this.onTap,
    this.title,
    this.sub,
  });

  final GestureTapCallback onTap;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Icon(Icons.play_arrow, size: 35),
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(sub),
    );
  }
}
