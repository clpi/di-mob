import 'package:flutter/material.dart';

class RecordCard extends StatefulWidget {
  RecordCard({Key key, this.name, this.desc, this.items}) : super(key: key);
  final String name;
  final String desc;
  final List<String> items;

  @override
  _RecordCardState createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // borderOnForeground: true,
      // elevation: Theme.of(context).cardTheme.elevation,
      // color: Theme.of(context).cardTheme.color,
      // clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.all(7.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.more_vert_rounded, color: Color(0xffffffff).withOpacity(0.8),),
              trailing: CircleAvatar(
                child: Icon(Icons.person_outline_rounded, size: 15,),
                backgroundColor: Color(0xffb0fe76),
                foregroundColor: Color(0xff0a080f),
                minRadius: 10,
                maxRadius: 15,
              ),
              title: Text(this.widget.name, style: TextStyle(color: Colors.white)),
              subtitle: Text(this.widget.desc,
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                this.widget.desc,
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              buttonMinWidth: 10.0,
              children: [
                FlatButton(
                  textColor: const Color(0xffb0fe76),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Edit'),
                ),
                FlatButton(
                  textColor: const Color(0xffb0fe76),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Goto'),
                ),
              ],
            ),
          ],
        ),

    );
  }
}