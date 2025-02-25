import 'dart:convert';

UserDataResponse userFromJson(String str) => UserDataResponse.fromJson(json.decode(str));

String userToJson(UserDataResponse data) => json.encode(data.toJson());

class UserDataResponse {
  int responseCode;
  String message;
  Data data;

  UserDataResponse({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) => UserDataResponse(
    responseCode: json["responseCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String name;
  String phoneNumber;
  int trustPoints;
  double rating;
  dynamic profilePicture;
  DateTime createdDate;
  List<UserRole> userRoles;
  List<dynamic> vehicles;

  Data({
    required this.name,
    required this.phoneNumber,
    required this.trustPoints,
    required this.rating,
    required this.profilePicture,
    required this.createdDate,
    required this.userRoles,
    required this.vehicles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    trustPoints: json["trustPoints"],
    rating: json["rating"],
    profilePicture: json["profilePicture"],
    createdDate: DateTime.parse(json["createdDate"]),
    userRoles: List<UserRole>.from(json["userRoles"].map((x) => UserRole.fromJson(x))),
    vehicles: List<dynamic>.from(json["vehicles"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNumber": phoneNumber,
    "trustPoints": trustPoints,
    "rating": rating,
    "profilePicture": profilePicture,
    "createdDate": createdDate.toIso8601String(),
    "userRoles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
    "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
  };
}

class UserRole {
  Role role;

  UserRole({
    required this.role,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    role: Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "role": role.toJson(),
  };
}

class Role {
  String roleName;

  Role({
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    roleName: json["roleName"],
  );

  Map<String, dynamic> toJson() => {
    "roleName": roleName,
  };
}

class User {
    int? userId;
    String? name;
    String? phoneNumber;
    int? trustPoints;
    double? rating;
    dynamic profilePicture;

    User({
        this.userId,
        this.name,
        this.phoneNumber,
        this.trustPoints,
        this.rating,
        this.profilePicture,
    });

    User copyWith({
        int? userId,
        String? name,
        String? phoneNumber,
        int? trustPoints,
        double? rating,
        dynamic profilePicture,
    }) =>
        User(
            userId: userId ?? this.userId,
            name: name ?? this.name,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            trustPoints: trustPoints ?? this.trustPoints,
            rating: rating ?? this.rating,
            profilePicture: profilePicture ?? this.profilePicture,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        trustPoints: json["trustPoints"],
        rating: json["rating"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "phoneNumber": phoneNumber,
        "trustPoints": trustPoints,
        "rating": rating,
        "profilePicture": profilePicture,
    };
}