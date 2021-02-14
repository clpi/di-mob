import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class DlSheetItem extends StatefulWidget {
  final String title;
  final String descr;
  final Icon icon;

  const DlSheetItem({
    this.title,
    this.descr,
    this.icon
  }) : super();

  @override 
  _DlSheetItemState createState() => _DlSheetItemState();
}

class _DlSheetItemState extends State<DlSheetItem> {

  @override
  void initState() {
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.widget.title, style: TextStyle(color: Colors.white)),
      leading: this.widget.icon,
      subtitle: Text(this.widget.descr, style: TextStyle(color: Colors.white60)),
      onLongPress: () {},
      onTap: () {},
      trailing: PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          const PopupMenuItem(child: ListTile(
            leading: Icon(Icons.add),
            title: Text("New fact"),
          )),
          const PopupMenuItem(child: ListTile(
            leading: Icon(Icons.room_preferences),
            title: Text("Fact preferences"),
          ))
        ],
      ),
      tileColor: Color(0xff1a181f),
      focusColor: Color(0xff4a484f),
      // trailing: Icon(Icons.menu_rounded),
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
            DlSheetItem(title: "New record", descr: "Create a new record", icon: Icon(Icons.book)),
            DlSheetItem(title: "New item", descr: "Create a new item", icon: Icon(Icons.account_tree)),
            DlSheetItem(title: "New fact", descr: "Create a new fact entry", icon: Icon(Icons.add)),
            DlSheetItem(title: "New link", descr: "Create a link between two items", icon: Icon(Icons.call_merge)),
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
        spacing: 4.0,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
            ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              title: Text(
              'Your Data',
                style: Theme.of(context).textTheme.headline5.copyWith(color: Color(0xff1a181f)),
                textAlign: TextAlign.center,

              ),
              // tileColor: Color(0xffb0fe76),
              tileColor: Color(0xffb0fe76),
            ),
              DlSheetItem(title: "Record 1", descr: "First record description", icon: Icon(Icons.book)),
              DlSheetItem(title: "Record 2", descr: "Record 2 descrrriiipttt", icon: Icon(Icons.library_books)),
              DlSheetItem(title: "Record 3", descr: "Doo da dee da doo", icon: Icon(Icons.book_online)),
              DlSheetItem(title: "Record 4", descr: "Record 4 description", icon: Icon(Icons.menu_book)),
          ]
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