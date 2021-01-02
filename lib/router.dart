import 'package:flutter/material.dart';
import 'package:dimo/models/record/record.dart';

class RecRouterDelegate extends RouterDelegate<RecRoutePath>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Record _selectedRecord;
  bool notFound = false;

  List<Record> records = [
    Record("Rec1"),
    Record("Rec2"),
    Record("rec3"),
  ];

  RecRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RecRoutePath get currentConfiguration {
    if (notFound) {
      return RecRoutePath.unknown();
    }
    return _selectedRecord == null
        ? RecRoutePath.home()
        : RecRoutePath.details(records.indexOf(_selectedRecord));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('RecordListPage'),
          child: RecordScreen(
            record: _selectedRecord,
          )
        ),
        if (notFound)
          MaterialPage(key: ValueKey("UnknownPage"), child: UnknownScreen())
        else if (_selectedRecord != null)
          RecordPage(record: _selectedRecord)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedRecord = null;
        notFound = false;
        notifyListeners();
        return true;
      }
    );
  }

  void _handleRecordTapped(Record record) {
    _selectedRecord = record;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(RecRoutePath path) async {
    if (path.isUnknown) {
      _selectedRecord = null;
      notFound = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > records.length - 1) {
        notFound = true;
        return;
      }
      _selectedRecord = records[path.id];
    } else {
      _selectedRecord = null;
    }
    notFound = false;
  }
}

class RecRoutePath {
  final int id;
  final bool isUnknown;

  RecRoutePath.home() : id = null, isUnknown = false;

  RecRoutePath.details(this.id) : isUnknown = false;

  RecRoutePath.unknown() : id = null, isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class RecordPage extends Page {
  final Record record;

  RecordPage({this.record}) : super(key: ValueKey(record));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return RecordScreen(record: record);
      }
    );
  }
}

class RecordScreen extends StatelessWidget {
  final Record record;

  RecordScreen({
    @required this.record,
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
            if ( record != null) ...[
              Text(record.name, style: Theme.of(context).textTheme.headline6),
              Text("record", style: Theme.of(context).textTheme.subtitle1),
            ]
          ]
        )
      )
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404'),
      )
    );
  }
}