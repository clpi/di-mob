import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';

class HomeCommunityPage extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomeCommunityPage(),
  );

  static String routeName = "Community";
  HomeCommunityPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<HomeCommunityPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Community", style: TextStyle(fontSize: 30)),
              MaterialButton(
                onPressed: () { },
              )
            ],
          ),
        )
    );
  }
}
