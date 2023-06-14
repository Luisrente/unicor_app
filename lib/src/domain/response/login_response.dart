import 'package:meta/meta.dart';
import 'dart:convert';

import '../models/export_model.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.user,
    this.token,
  });

  final User? user;
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": user!.toJson(),
        "token": token,
      };
}