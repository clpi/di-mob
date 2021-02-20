import 'package:flutter/material.dart';

class RecordCard extends StatefulWidget {
  RecordCard({
    Key key, 
    this.name, 
    this.desc, 
    this.items,
    this.created,
  }) : super(key: key);
  final String name;
  final String desc;
  final DateTime created;
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
      child: InkWell(
        canRequestFocus: true,
        focusColor: Colors.black26,
        enableFeedback: true,
        highlightColor: Colors.black12,
        onDoubleTap: () {},
        onTap: () {},
        splashColor: Colors.white12,
        child: Column(
          children: [
            ListTile(
              // trailing: Icon(Icons.more_vert_rounded, color: Color(0xffffffff).withOpacity(0.8),),
              trailing: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Seattle, WA", style: TextStyle(color: Color(0xffb0fe76).withOpacity(0.6))),
                    Text("4d 1h 38m ago", style: TextStyle(color: Colors.white24)),
                  ]
                ),
                onPressed: () {},
              ),
              leading: CircleAvatar(
                child: Icon(Icons.person_outline_rounded, size: 15, ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  newBtn(context),
                  shareBtn(context),
                  usersBtn(context),
                  optionsBtn(context)
                ],
            ),
                // IconButton(icon: Icon(Icons.add_circle_outline_outlined), onPressed: () {}, color: Colors.white, iconSize: 20, tooltip: "Add a new item or fact"),
                // IconButton(icon: Icon(Icons.view_list_outlined), onPressed: () {}, color: Colors.white, iconSize: 20, tooltip: "Add a new item or fact"),
                // IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}, color: Colors.white, iconSize: 20, tooltip: "Share this record",),
                // IconButton(icon: Icon(Icons.more_vert_outlined), onPressed: () {}, color: Colors.white, iconSize: 20, tooltip: "Share this record",),
            ),
          ],
        ),
      )
    );
  }

  ButtonBar newBtn(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      buttonPadding: EdgeInsets.only(left: 0.0),
      overflowButtonSpacing: 0.0,
      buttonMinWidth: 20,

      children: [
        IconButton(
          icon: Icon(Icons.add_circle_outline_outlined,  ), 
          onPressed: () {}, 
          color: Colors.white, 
          iconSize: 20, 
          tooltip: "Add a new item or fact",
          padding: EdgeInsets.zero,
          alignment: Alignment.bottomLeft,
          constraints: BoxConstraints(maxWidth: 30),
          enableFeedback: true,
        ),
        FlatButton(
          minWidth: 20,
          child: Text("20", textAlign: TextAlign.start, style: TextStyle(color: Colors.white38, fontSize: 14),),
          visualDensity: VisualDensity.compact,
          onPressed: () {},
          padding: EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
        )
       ],
     );
  }

  ButtonBar shareBtn(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      mainAxisSize: MainAxisSize.max,
      buttonPadding: EdgeInsets.zero,
      overflowButtonSpacing: 0.0,
      buttonMinWidth: 20,

      children: [
        IconButton(
          icon: Icon(Icons.share_outlined,  ), 
          onPressed: () {}, 
          color: Colors.white, 
          iconSize: 20, 
          tooltip: "Share this record",
          padding: EdgeInsets.zero,
          alignment: Alignment.bottomLeft,
          constraints: BoxConstraints(maxWidth: 30),
          enableFeedback: true,
        ),
        FlatButton(
          minWidth: 10,
          child: Text("13", textAlign: TextAlign.start, style: TextStyle(color: Colors.white54, fontSize: 14),),
          visualDensity: VisualDensity.compact,
          onPressed: () {},
          padding: EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
        )
       ],
     );
  }

  ButtonBar usersBtn(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      buttonPadding: EdgeInsets.only(left: 0.0),
      overflowButtonSpacing: 0.0,
      buttonMinWidth: 20,

      children: [
        IconButton(
          icon: Icon(Icons.person_outlined,  ), 
          onPressed: () {}, 
          color: Colors.white, 
          iconSize: 20, 
          tooltip: "View record users",
          padding: EdgeInsets.zero,
          alignment: Alignment.bottomLeft,
          constraints: BoxConstraints(maxWidth: 30),
          enableFeedback: true,
        ),
        FlatButton(
          minWidth: 10,
          child: Text("6", textAlign: TextAlign.start, style: TextStyle(color: Colors.white38, fontSize: 14),),
          visualDensity: VisualDensity.compact,
          onPressed: () {},
          padding: EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
        )
       ],
     );
  }

  ButtonBar optionsBtn(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      buttonPadding: EdgeInsets.only(left: 0.0),
      overflowButtonSpacing: 0.0,
      buttonMinWidth: 20,

      children: [
        IconButton(
          icon: Icon(Icons.more_vert_outlined,  ), 
          onPressed: () {}, 
          color: Colors.white, 
          iconSize: 20, 
          tooltip: "Share this record",
          padding: EdgeInsets.zero,
          alignment: Alignment.bottomLeft,
          constraints: BoxConstraints(maxWidth: 30),
          enableFeedback: true,
        ),
        // FlatButton(
        //   minWidth: 10,
        //   child: Text("13", textAlign: TextAlign.start, style: TextStyle(color: Colors.white38, fontSize: 14),),
        //   visualDensity: VisualDensity.compact,
        //   onPressed: () {},
        //   padding: EdgeInsets.all(0),
        //   clipBehavior: Clip.antiAlias,
        // )
       ],
     );
  }
}