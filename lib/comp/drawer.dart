import 'package:flutter/material.dart';
import 'package:dimo/page/home/home.dart';

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
            child: FlutterLogo(size: 42.0),
            backgroundColor: Color(0xff44d367),
          ),
          accountEmail: Text("clp@clp")),
      ListTile(
        title: Text("Profile"),
        leading: const Icon(Icons.supervised_user_circle),
        selectedTileColor: Colors.deepPurpleAccent,
        focusColor: Colors.deepPurpleAccent,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      ListTile(
        title: Text("Feedback"),
        leading: const Icon(Icons.feedback),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Contact"),
        leading: const Icon(Icons.contact_mail),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Preferences"),
        leading: const Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("Account"),
        leading: const Icon(Icons.account_box),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
    return Drawer(
        semanticLabel: "drawer",
        elevation: 5.0,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[] + drawerItems,
          ),
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
