import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';
import 'package:dimo/comp/new_sheet.dart';

class RecordsListPage extends StatefulWidget {

  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => RecordsListPage(records: [], onTapped: (rec) {}, key: ValueKey("Records"),),
  );
  static String routeName = "Records";
  List<Record> records;
  final ValueChanged<Record> onTapped;

  RecordsListPage({Key key,
    @required this.records,
    @required this.onTapped
  }) : super(key: key);

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsListPage> {
  final sheet = DlSheet();
  @override
  Widget build(BuildContext context) {
    final drawer = DlDrawer(index: DrawerIndex.Home, key: Key("drawer"));
    final bottomBar = DlBottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 10.0,
        title: Row(children: [
          Icon(Icons.book_outlined),
          Divider(indent: 5,),
          Text("records", style: TextStyle(color: Colors.white, fontSize: 21.0),),
        ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          // IconButton(icon: Icon(Icons.list_alt), onPressed: () => _viewRecords(context),),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => sheet.show(context),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {sheet.show(context);},
        child: Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DlBottomBar(restorationId: "", key: Key(""), type: BottomBarKind.Labels),
      drawer: drawer,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Records"),
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
      ),
    );
  }

  void _addRecord(Record record) {
    setState(() {
      this.widget.records.add(record);
    });
  }
}
