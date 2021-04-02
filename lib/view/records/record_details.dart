import 'package:dimo/models/record/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class RecordDetailsPage extends Page {
  final Record record;

  RecordDetailsPage({
    this.record
  }) : super(key: ValueKey(record));

  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: RecordDetailsScreen(
            key: ValueKey(record),
            record: record,
          )
        );
      }
    );
  }
}

class RecordDetailsScreen extends StatelessWidget {
  final Record record;
  ValueKey key;

  RecordDetailsScreen({
    this.key,
    @required this.record
  });

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (record != null) ...[
              Text(record.name, style: Theme.of(context).textTheme.headline1),
              Text(record.descr, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        )
      )
    );
  }
}