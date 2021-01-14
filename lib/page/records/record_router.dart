import 'package:flutter/widgets.dart';

class RecordRoutePath {
  final int id;
  final bool isUnknown;

  RecordRoutePath.home()
    : id = null, isUnknown = false;

  RecordRoutePath.details(this.id) : isUnknown = false;

  RecordRoutePath.unknown()
    : id = null, isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}
class RecordRouterDelegate extends RouterDelegate<RecordRoutePath> 
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecordRoutePath> {

  @override 
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override 
  GlobalKey<NavigatorState> get navigatorKey => throw UnimplementedError();

  @override 
  Future<void> setNewRoutePath(RecordRoutePath configuration) {
    throw UnimplementedError();
  }
}