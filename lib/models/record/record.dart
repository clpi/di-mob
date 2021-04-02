import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum RecordVisibility {
  Private,
  Public,
  FriendsOnly
}

class Record {
  final int id;
  final String name;
  final String descr;
  final bool private;
  final int userId;
  final DateTime createdAt;
  final String image;
  final String coverImage;
  final bool starred;

  Record({
    this.id, 
    this.name, 
    this.createdAt,
    this.private, 
    this.userId, 
    this.image, 
    this.coverImage, 
    this.starred,
  this.descr});

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'description': descr,
      'created_at': createdAt.toUtc(),
      'private': private,
      'image': image,
      'cover_image': coverImage,
      'starred': starred,
    };
  }

  Future<Database> getOrCreateTable() async {
    final Future<Database> database = openDatabase(
     join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE records(id INTEGER PRIMARY KEY, name TEXT, created_at DATETIME)",
      );
    },
    version: 1,
    );
    return database;
  }

  Future<void> insert(Record record) async {
    final Database db = await getOrCreateTable();
    await db.insert(
      'records',
      record.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
}