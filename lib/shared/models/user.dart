import 'dart:convert';

class User {
  final String name;
  final String photoUrl;

  User({required this.name, required this.photoUrl});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map["name"],
      photoUrl: map["photoUrl"],
    );
  }

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "name": this.name,
        "photoUrl": this.photoUrl,
      };

  String toJson() => jsonEncode(toMap());
}
