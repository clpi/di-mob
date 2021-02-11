import 'package:flutter/material.dart';

class DlTimeline extends StatefulWidget {
  DlTimeline({Key key, this.items, this.title}) : super(key: key);

  final String title;
  final List<Widget> items;

  @override
  _DlTimelineState createState() => _DlTimelineState();
}

class _DlTimelineState extends State<DlTimeline> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}