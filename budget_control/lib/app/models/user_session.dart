// To parse this JSON data, do
//
//     final userSession = userSessionFromJson(jsonString);

import 'dart:convert';

UserSession userSessionFromJson(String str) => UserSession.fromJson(json.decode(str));

String userSessionToJson(UserSession data) => json.encode(data.toJson());

class UserSession {
    int? userId;
    String? name;
    String? phoneNumber;
    dynamic profilePicture;
    DateTime? createdDate;
    List<UserRole>? userRoles;

    UserSession({
        this.userId,
        this.name,
        this.phoneNumber,
        this.profilePicture,
        this.createdDate,
        this.userRoles,
    });

    UserSession copyWith({
        int? userId,
        String? name,
        String? phoneNumber,
        dynamic profilePicture,
        DateTime? createdDate,
        List<UserRole>? userRoles,
    }) =>
        UserSession(
            userId: userId ?? this.userId,
            name: name ?? this.name,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            profilePicture: profilePicture ?? this.profilePicture,
            createdDate: createdDate ?? this.createdDate,
            userRoles: userRoles ?? this.userRoles,
        );

    factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
        userId: json["userId"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        profilePicture: json["profilePicture"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        userRoles: json["userRoles"] == null ? [] : List<UserRole>.from(json["userRoles"]!.map((x) => UserRole.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
        "createdDate": createdDate?.toIso8601String(),
        "userRoles": userRoles == null ? [] : List<dynamic>.from(userRoles!.map((x) => x.toJson())),
    };
}

class UserRole {
    dynamic id;
    Role? role;

    UserRole({
        this.id,
        this.role,
    });

    UserRole copyWith({
        dynamic id,
        Role? role,
    }) =>
        UserRole(
            id: id ?? this.id,
            role: role ?? this.role,
        );

    factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role?.toJson(),
    };
}

class Role {
    String? roleName;

    Role({
        this.roleName,
    });

    Role copyWith({
        String? roleName,
    }) =>
        Role(
            roleName: roleName ?? this.roleName,
        );

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleName: json["roleName"],
    );

    Map<String, dynamic> toJson() => {
        "roleName": roleName,
    };
}


