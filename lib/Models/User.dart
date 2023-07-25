
import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.ci,
    required this.ri,
    required this.li
  });

  final String name;
  final String phone;
  final String email;
  final String password;
  final bool ci;
  final bool ri;
  final bool li;

  factory User.fromJson(Map<String, dynamic> json) => User
    (

    name: json["name"],
    phone: json["phone"] ,
    email: json["email"],
    password: json["password"] ,
    ci: json["ci"],
    ri: json["ri"],
     li: json["li"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone" :phone,
    "email" :email,
    "password" :password,
    "ci"  :ci,
    "ri"  :ri,
    "li"  :li,
  };
}
