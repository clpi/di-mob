enum UserType {
  Normal,
  Admin,
}

class User {
  final String username;
  final String email;
  final String name;
  final String phoneNumber;

  User({
    this.username,
    this.email,
    this.name,
    this.phoneNumber,
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
