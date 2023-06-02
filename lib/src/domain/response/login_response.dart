import 'package:meta/meta.dart';
import 'dart:convert';

import '../models/export_model.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.usuario,
    this.token,
  });

  final User? usuario;
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        usuario: User.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario!.toJson(),
        "token": token,
      };
}