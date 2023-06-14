import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());


class User {
    final List<String>? programs;
    final String? firstName;
    final String? middleName;
    final String? lastName;
    final String? secondLastName;
    final int? identification;
    final String? email;
    final String? role;
    final String? status;
    final String? campus;
    final String? profilePicture;
    final String? identificationPicture;
    final String? uid;

    User({
        this.programs,
        this.firstName,
        this.middleName,
        this.lastName,
        this.secondLastName,
        this.identification,
        this.email,
        this.role,
        this.status,
        this.campus,
        this.profilePicture,
        this.identificationPicture,
        this.uid,
    });

    User copyWith({
        List<String>? programs,
        String? firstName,
        String? middleName,
        String? lastName,
        String? secondLastName,
        int? identification,
        String? email,
        String? role,
        String? status,
        String? campus,
        String? profilePicture,
        String? identificationPicture,
        String? uid,
    }) => 
        User(
            programs: programs ?? this.programs,
            firstName: firstName ?? this.firstName,
            middleName: middleName ?? this.middleName,
            lastName: lastName ?? this.lastName,
            secondLastName: secondLastName ?? this.secondLastName,
            identification: identification ?? this.identification,
            email: email ?? this.email,
            role: role ?? this.role,
            status: status ?? this.status,
            campus: campus ?? this.campus,
            profilePicture: profilePicture ?? this.profilePicture,
            identificationPicture: identificationPicture ?? this.identificationPicture,
            uid: uid ?? this.uid,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());
        factory User.empty() => User(
        identification:0,
        firstName:'',
        middleName:'',
        lastName:'',
        secondLastName:'',
        role:'',
        profilePicture:'',
        identificationPicture:'',
        email:'',
        status:'',
        uid:'',
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        programs: List<String>.from(json["programs"].map((x) => x)),
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        secondLastName: json["second_last_name"],
        identification: json["identification"],
        email: json["email"],
        role: json["role"],
        status: json["status"],
        campus: json["campus"],
        profilePicture: json["profile_picture"],
        identificationPicture: json["identification_picture"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "programs": List<dynamic>.from(programs!.map((x) => x)),
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "second_last_name": secondLastName,
        "identification": identification,
        "email": email,
        "role": role,
        "status": status,
        "campus": campus,
        "profile_picture": profilePicture,
        "identification_picture": identificationPicture,
        "uid": uid,
    };
}




