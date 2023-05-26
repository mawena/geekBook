import 'dart:convert';

import '../../config/api.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.token,
    required this.username,
    required this.email,
    required this.institutToken,
    required this.institutLibelle,
    required this.institutSigle,
    required this.level,
    required this.imagePath,
    required this.creationDate,
    required this.updateDate,
  });
  String token = "";
  String username = "";
  String email = "";
  String institutToken = "";
  String institutLibelle = "";
  String institutSigle = "";
  String level = "";
  String imagePath = "";
  String creationDate = "";
  String updateDate = "";

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"] as String,
        username: json["username"] as String,
        email: json["email"] as String,
        institutToken: json["institutToken"] as String,
        institutLibelle: json["institutLibelle"] as String,
        institutSigle: json["institutSigle"] as String,
        level: json["level"] as String,
        imagePath: json["imagePath"],
        creationDate: json["creationDate"] as String,
        updateDate: json["updateDate"] as String,
      );
  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
        'email': email,
        'institutToken': institutToken,
        'institutLibelle': institutLibelle,
        'institutSigle': institutSigle,
        'level': level,
        'imagePath': imagePath,
        'creationDate': creationDate,
        'updateDate': updateDate
      };
}
