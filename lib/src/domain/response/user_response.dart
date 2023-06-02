// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';
import '../models/export_model.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
       required this.usuario,
    });

    User usuario;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        usuario: User.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
    };
}
