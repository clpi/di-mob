import 'package:flutter/material.dart';
import 'package:dimo/router.dart';
import 'package:dimo/comp/card.dart';
import 'package:dimo/models/record/record.dart';
import 'package:dimo/comp/bottom_bar.dart';
import 'package:dimo/comp/drawer.dart';

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
  @override
  Widget build(BuildContext context) {
    final drawer = DlDrawer(index: DrawerIndex.Home, key: Key("drawer"));
    final bottomBar = DlBottomBar(key: Key("bottomBar"), restorationId: "bottom_bar", type: BottomBarKind.Labels);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10.0,
        title: Text("Records"),
        automaticallyImplyLeading: true,
        //backgroundColor: Colors.deepPurpleAccent,
      ),
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
      bottomNavigationBar: bottomBar,
    );
  }

  void _addRecord(Record record) {
    setState(() {
      this.widget.records.add(record);
    });
  }
}
