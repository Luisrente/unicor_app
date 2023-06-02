// import 'package:meta/meta.dart';
// import 'dart:convert';

// User usuarioFromJson(String str) => User.fromJson(json.decode(str));
// String usuarioToJson(User data) => json.encode(data.toJson());

// class User {
//   User({
//     this.id,
//     this.nombre1,
//     this.nombre2,
//     this.apellido1,
//     this.apellido2,
//     this.cargo,
//     this.documento,
//     this.dependencia,
//     this.correo,
//     this.sede,
//     this.img,
//     this.rol,
//     this.code,
//     this.codeTime,
//     this.estado,
//     this.verfi,
//   });

//   final String? id;
//   final String? nombre1;
//   final String? nombre2;
//   final String? apellido1;
//   final String? apellido2;
//   final String? cargo;
//   final String? documento;
//   final String? dependencia;
//   final String? correo;
//   final String? sede;
//   String? img;
//   final String? rol;
//   final int? code;
//   final String? codeTime;
//   final String? estado;
//   final String? verfi;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         nombre1: json["nombre1"],
//         nombre2: json["nombre2"],
//         apellido1: json["apellido1"],
//         apellido2: json["apellido2"],
//         cargo: json["cargo"],
//         documento: json["documento"],
//         dependencia: json["dependencia"],
//         correo: json["correo"],
//         sede: json["sede"],
//         img: json["img"],
//         rol: json["rol"],
//         code: json["code"],
//         codeTime: json["codeTime"],
//         estado: json["estado"],
//         verfi: json["verfi"],
//       );

//   factory User.empty() => User(
//         id:'',
//         nombre1: '',
//         nombre2: '',
//         apellido1: '',
//         apellido2: '',
//         cargo: '',
//         documento: '',
//         dependencia: '',
//         correo: '',
//         sede: '',
//         img: '',
//         rol: '',
//         code: 0,
//         codeTime: '',
//         estado: '',
//         verfi: '',
//       );

//     User copyWith(
//       {
//    String? id,
//    String? nombre1,
//    String? nombre2,
//    String? apellido1,
//    String? apellido2,
//    String? cargo,
//    String? documento,
//    String? dependencia,
//    String? correo,
//    String? sede,
//    String? img,
//    String? rol,
//    int? code,
//    String? codeTime,
//    String? estado,
//    String? verfi
//       }
//     ){
//     return User(
//    id: id ?? this.id ,
//    nombre1: nombre1 ?? this.nombre1,
//    nombre2: nombre2 ?? this.nombre2 ,
//    apellido1: apellido1 ?? this.apellido1,
//    apellido2: apellido2 ?? this.apellido2,
//    cargo: cargo ?? this.cargo,
//    documento: documento ?? this.documento,
//    dependencia: dependencia ?? this.dependencia,
//    correo: correo ?? this.correo,
//    sede: sede ?? this.sede,
//    img: img ?? this.img,
//    rol: rol ?? this.rol,
//    code: code ?? this.code,
//    codeTime: codeTime ?? this.codeTime,
//    estado: estado ?? this.estado,
//    verfi: verfi ?? this.verfi
//    );

//    }



//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre1": nombre1,
//         "nombre2": nombre2,
//         "apellido1": apellido1,
//         "apellido2": apellido2,
//         "cargo": cargo,
//         "documento": documento,
//         "dependencia": dependencia,
//         "correo": correo,
//         "sede": correo,
//         "img": img,
//         "rol": rol,
//         "code": code,
//         "codeTime": codeTime,
//         "estado": estado,
//         "verfi": verfi,
//       };
// }


// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    final String? rol;
    final bool? estado;
    final bool? google;
    final String? cedula;
    final String? nombre1;
    final String? nombre2;
    final String? apellido1;
    final String? apellido2;
    final String? facultad;
    final String? programa;
    final String? img;
    final String? correo;
    final String? verifi;
    final String? uid;

    User({
        this.rol,
        this.estado,
        this.google,
        this.cedula,
        this.nombre1,
        this.nombre2,
        this.apellido1,
        this.apellido2,
        this.facultad,
        this.programa,
        this.img,
        this.correo,
        this.verifi,
        this.uid,
    });

    User copyWith({
        String? rol,
        bool? estado,
        bool? google,
        String? cedula,
        String? nombre1,
        String? nombre2,
        String? apellido1,
        String? apellido2,
        String? facultad,
        String? programa,
        String? img,
        String? correo,
        String? verifi,
        String? uid,
    }) => 
        User(
            rol: rol ?? this.rol,
            estado: estado ?? this.estado,
            google: google ?? this.google,
            cedula: cedula ?? this.cedula,
            nombre1: nombre1 ?? this.nombre1,
            nombre2: nombre2 ?? this.nombre2,
            apellido1: apellido1 ?? this.apellido1,
            apellido2: apellido2 ?? this.apellido2,
            facultad: facultad ?? this.facultad,
            programa: programa ?? this.programa,
            img: img ?? this.img,
            correo: correo ?? this.correo,
            verifi: verifi ?? this.verifi,
            uid: uid ?? this.uid,
        );


    factory User.empty() => User(
        rol:'',
        estado:false,
        google:true,
        cedula:'',
        nombre1:'',
        nombre2:'',
        apellido1:'',
        apellido2:'',
        facultad:'',
        programa:'',
        img:'',
        correo:'',
        verifi:'',
        uid:'',
      );


    factory User.fromJson(Map<String, dynamic> json) => User(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        cedula: json["cedula"],
        nombre1: json["nombre1"],
        nombre2: json["nombre2"],
        apellido1: json["apellido1"],
        apellido2: json["apellido2"],
        facultad: json["facultad"],
        programa: json["programa"],
        img: json["img"],
        correo: json["correo"],
        verifi: json["verifi"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "cedula": cedula,
        "nombre1": nombre1,
        "nombre2": nombre2,
        "apellido1": apellido1,
        "apellido2": apellido2,
        "facultad": facultad,
        "programa": programa,
        "img": img,
        "correo": correo,
        "verifi": verifi,
        "uid": uid,
    };
}
