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
    final String? cedulaImg;
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
        this.cedulaImg,
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
        String? cedulaImg,
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
            cedulaImg: cedulaImg ?? this.cedulaImg,
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
        cedulaImg:'',
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
        cedulaImg: json["cedulaImg"],
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
        "cedulaImg": cedulaImg,
        "correo": correo,
        "verifi": verifi,
        "uid": uid,
    };
}
