import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


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
              Text("Tes paget", style: TextStyle(fontSize: 30)),
              MaterialButton(
                textColor: Colors.white,
                child: Text("Hello there!", style: TextStyle(color: Colors.white),),

                color: Color(0xffb0fe76),
                onPressed: () {
                    Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.blue,
          fontSize: 16.0
      );
                 },
              )
            ],
          ),
        )
    );
  }
}
