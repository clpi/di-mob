import 'package:flutter/material.dart';

class Record {
  Record(
    @required this.name, 
    this.description
   );

  final String name;
  String description = "";
}

// class _Record {
//   const Record({this.id, this.name, this.items, this.attributes, this.notes, this.createdAt});
//   final String id;
//   final String name;
//   final List<String> items;
//   final List<String> attributes;
//   final List<String> notes;
//   final DateTime createdAt;
//
// }