import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DlSheet extends StatefulWidget{

  @override
  _DlSheetState createState() => _DlSheetState();

  void show(BuildContext context) {
     showModalBottomSheet(
      context: context,
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
        children: [
          ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            title: Text(
              'Create',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,

            ),
            tileColor: Colors.deepPurpleAccent,
          ),
          ListTile(
            title: Text('New fact'),
            leading: Icon(Icons.add),
            subtitle: Text("Create a new fact entry", style: TextStyle(color: Colors.white54)),
            // trailing: Icon(Icons.menu_rounded)
          ),
          ListTile(
            title: Text('New item'),
            leading: Icon(Icons.lightbulb),
            subtitle: Text("Create a new item entry", style: TextStyle(color: Colors.white54)),
            // trailing: Icon(Icons.menu_rounded),
          ),
          ListTile(
            title: Text('New record'),
            leading: Icon(Icons.book),
            subtitle: Text("Create a new record", style: TextStyle(color: Colors.white54)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // trailing: Icon(Icons.menu_rounded),
          ),
          ListTile(
            title: Text('New link'),
            leading: Icon(Icons.call_merge),
            subtitle: Text("Create a new link", style: TextStyle(color: Colors.white54)),
            trailing: Icon(Icons.menu_rounded),
          ),
        ],
      );

  }

}
