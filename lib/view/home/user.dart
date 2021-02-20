import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';

class HomeUserPage extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomeUserPage(),
  );

  static String routeName = "User";
  HomeUserPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<HomeUserPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Prefs"),
              MaterialButton(
                onPressed: () { },
              )
            ],
          ),
        )
    );
  }
}
