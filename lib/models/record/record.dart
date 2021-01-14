enum RecordVisibility {
  Private,
  Public,
  FriendsOnly
}

class Record {
  final String name;
  final RecordVisibility visibility;
  String description = "";
  bool starred;
  DateTime created;

  Record({
    this.name,
    this.visibility,
    this.description,
    this.starred,
    this.created,
  });
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
