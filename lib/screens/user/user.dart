import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
        ],
        title: Text("User"),
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
      body: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () { },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
