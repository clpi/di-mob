import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SheetType {
  New,
  List
}

class DlSheet extends StatefulWidget{

  @override
  _DlSheetState createState() => _DlSheetState();

  void show(BuildContext context) {
     showModalBottomSheet(
      context: context,
      enableDrag: true,
      builder: (context) {
        return DlSheet();
      }
    );
  }


}

class _DlSheetState extends State<DlSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        clipBehavior: Clip.antiAlias,
        spacing: 4.0,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
            ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              title: Text(
                'Create',
                style: Theme.of(context).textTheme.headline5.copyWith(color: Color(0xff1a181f)),
                textAlign: TextAlign.center,

              ),
              // tileColor: Color(0xffb0fe76),
              tileColor: Color(0xffb0fe76),
            ),
            ListTile(
              title: Text('New fact', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.add),
              subtitle: Text("Create a new fact entry", style: TextStyle(color: Colors.white60)),
              tileColor: Color(0xff1a181f),
              focusColor: Color(0xff4a484f),
              // trailing: Icon(Icons.menu_rounded)
            ),
            ListTile(
              title: Text('New item', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.lightbulb, color: Colors.white),
              subtitle: Text("Create a new item entry", style: TextStyle(color: Colors.white60)),
              tileColor: Color(0xff1a181f),
              focusColor: Color(0xff4a484f),
              // trailing: Icon(Icons.menu_rounded),
            ),
            ListTile(
              title: Text('New record', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.book),
              subtitle: Text("Create a new record", style: TextStyle(color: Colors.white60)),
              tileColor: Color(0xff1a181f),
              focusColor: Color(0xff4a484f),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              // trailing: Icon(Icons.menu_rounded),
            ),
            ListTile(
              title: Text('New link', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.call_merge),
              subtitle: Text("Create a new link", style: TextStyle(color: Colors.white60)),
              tileColor: Color(0xff1a181f),
              focusColor: Color(0xff4a484f),
              // trailing: Icon(Icons.menu_rounded),
            ),
          ]
      );

  }

}

class DlListSheet extends StatefulWidget{

  @override
  _DlListSheetState createState() => _DlListSheetState();

  void show(BuildContext context) {
     showModalBottomSheet(
      context: context,
      builder: (context) {
        return DlListSheet();
      }
    );
  }


}

class _DlListSheetState extends State<DlListSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        clipBehavior: Clip.antiAlias,
        runAlignment: WrapAlignment.start,
        children: [
          ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            title: Text(
              'Your Records',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,

            ),
            tileColor: Colors.deepPurpleAccent,
          ),
          ListTile(
            title: Text('Record 1', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.menu_book_outlined),
            subtitle: Text("Description of record 1", style: TextStyle(color: Colors.white60)),
            tileColor: Color(0xff1a181f),
            focusColor: Color(0xff4a484f),
            // trailing: Icon(Icons.menu_rounded)
          ),
          ListTile(
            title: Text('Record 2', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.menu_book_outlined),
            subtitle: Text("Description of record 1", style: TextStyle(color: Colors.white60)),
            tileColor: Color(0xff1a181f),
            focusColor: Color(0xff4a484f),
            // trailing: Icon(Icons.menu_rounded),
          ),
          ListTile(
            title: Text('Record 4', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.menu_book_outlined),
            subtitle: Text("Description of record 1", style: TextStyle(color: Colors.white60)),
            tileColor: Color(0xff1a181f),
            focusColor: Color(0xff4a484f),
            // trailing: Icon(Icons.menu_rounded),
          ),
          ListTile(
            title: Text('Record 5', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.menu_book_outlined),
            subtitle: Text("Description of record 1", style: TextStyle(color: Colors.white60)),
            tileColor: Color(0xff1a181f),
            focusColor: Color(0xff4a484f),
            // trailing: Icon(Icons.menu_rounded),
          ),
        ],
      );

  }

}

class NotifSheet extends StatefulWidget{

  @override
  _NotifSheetSt createState() => _NotifSheetSt();

  void show(BuildContext context) {
     showModalBottomSheet(
      context: context,
      builder: (context) {
        return DlListSheet();
      }
    );
  }


}

class _NotifSheetSt extends State<NotifSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        clipBehavior: Clip.antiAlias,
        runAlignment: WrapAlignment.start,
        children: [
          ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,

            ),
            tileColor: Colors.deepPurpleAccent,
          ),
          ListTile(
            title: Text('Record 1'),
            leading: Icon(Icons.menu_book_outlined),
            subtitle: Text("Create a new fact entry", style: TextStyle(color: Colors.white54)),
            // trailing: Icon(Icons.menu_rounded)
          ),
        ],
      );

  }

}