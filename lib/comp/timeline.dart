import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

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
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Timeline Event $index'),
        ),
        itemCount: 10,
      ),
    );
  }
}