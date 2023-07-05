import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(
      json.decode(str).map(
            (x) => User.fromJson(x),
          ),
    );

String userToJson(List<User> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? number;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.number,
  });

  factory User.fromJson(Map json) => User(
        id: json['id'],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        "name": name,
        "email": email,
        "password": password,
        "number": number,
      };
}
