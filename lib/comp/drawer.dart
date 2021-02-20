import 'package:flutter/material.dart';
import 'package:dimo/view/home/dash.dart';
import 'package:dimo/view/auth/login.dart';

class DlDrawer extends StatefulWidget {
  const DlDrawer({
    Key key,
    this.index}) : super(key: key);

  final DrawerIndex index;

  @override
  _DlDrawerState createState() => _DlDrawerState();
}

class _DlDrawerState extends State<DlDrawer> {

  List<DrawerList> drawerList;

  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.Home,
        labelName: 'Home',
        icon: Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.Help,
        labelName: 'Help',
        icon: Icon(Icons.help),
      ),
      DrawerList(
        index: DrawerIndex.About,
        labelName: 'About',
        icon: Icon(Icons.question_answer),
      ),
      DrawerList(
        index: DrawerIndex.Feedback,
        labelName: 'Feedback',
        icon: Icon(Icons.feedback),
      ),
      DrawerList(
        index: DrawerIndex.Account,
        labelName: 'Account',
        icon: Icon(Icons.account_circle),
      ),
      DrawerList(
        index: DrawerIndex.Preferences,
        labelName: 'Preferences',
        icon: Icon(Icons.settings),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItems = [
      UserAccountsDrawerHeader(
          arrowColor: Colors.white,
          onDetailsPressed: () => showAboutDialog(context: context),
          otherAccountsPictures: [ Icon(Icons.access_alarm)],
          accountName: Text("chris (clp)"),
          currentAccountPicture: const CircleAvatar(
            child: Icon(Icons.person_outlined),
            foregroundColor: Color(0xff0a080f),
            backgroundColor: Color(0xffb0fe76),
          ),
          accountEmail: Text("clp@clp.is")),
           Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Header',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
      ListTile(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.supervised_user_circle),
        selectedTileColor: Colors.deepPurpleAccent,
        focusColor: Color(0xb0fe76),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashPage()));
        },
      ),
      ListTile(
        title: Text("Feedback", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.feedback),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Contact", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.contact_mail),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Preferences", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Account", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.account_box),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Log out", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.logout),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {return LoginPage(); }));
        },
      ),
    ];
    return Drawer(
        semanticLabel: "drawer",
        elevation: 5.0,
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
          ] + drawerItems,
          // color: Color(0xff2a282f),
          // width: double.infinity,
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[] + drawerItems,
          // ),
        ),
      );
  }
}

enum DrawerIndex {
  Home,
  Help,
  Account,
  About,
  Feedback,
  Preferences,
}

class DrawerList {
  DrawerList({
    this.labelName = '',
    this.icon,
    this.index,
  });

  String labelName;
  Icon icon;
  DrawerIndex index;
}
