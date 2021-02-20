import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/sheet.dart';
import 'package:dimo/comp/fab.dart';
import 'package:dimo/comp/app_bar.dart';

class HomeRecordsPage extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => HomeRecordsPage(records: [], onTapped: (rec) {}, key: ValueKey("Records"),),
  );

  static String routeName = "Records";
  List<Record> records;
  final ValueChanged<Record> onTapped;

  HomeRecordsPage({Key key,
    @required this.records,
    @required this.onTapped
  }) : super(key: key);

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<HomeRecordsPage> {
  final sheet = DlSheet();
  @override
  Widget build(BuildContext context) {
    final dlDrawer = DlDrawer(index: DrawerIndex.Home, key: Key("drawer"));
    return body(context);
    // return Scaffold(
    //   appBar: DlAppBar(key: Key("appBar"), title: "records").bar(context),
    //   body: body(context),
    //   floatingActionButton: DlFab(sheet: DlSheet()),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: DlBottomBar(currentIndex: 1, key: Key(""), type: BottomBarKind.Labels),
    //   drawer: dlDrawer,
    // );
  }

  Widget body(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Records", style: TextStyle(fontSize: 30)),
              ListView(
                children: [
                  for (var rec in widget.records)
                    ListTile(
                      title: Text(rec.name),
                      subtitle: Text(rec.description),
                      onTap: () => widget.onTapped(rec),
                    )
                ],
              ),
              MaterialButton(
                onPressed: () {},
              )
            ],
          ),
        ),
      );

  }

  void _addRecord(Record record) {
    setState(() {
      this.widget.records.add(record);
    });
  }
}
