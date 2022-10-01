// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.userInfo,
  });

  String? token;
  UserInfo? userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userInfo: UserInfo.fromJson(json["userInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userInfo": userInfo!.toJson(),
      };
}

class UserInfo {
  UserInfo({
    this.id,
    this.image,
    this.roleId,
    this.clinicId,
    this.clinicData,
    this.email,
    this.lastName,
    this.firstName,
  });

  String? id;
  String? image;
  RoleId? roleId;
  String? clinicId;
  ClinicData? clinicData;
  String? email;
  String? lastName;
  String? firstName;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["_id"],
        image: json["image"],
        roleId: RoleId.fromJson(json["role_id"]),
        clinicId: json["clinic_id"],
        clinicData: ClinicData.fromJson(json["clinicData"]),
        email: json["email"],
        lastName: json["lastName"],
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "role_id": roleId!.toJson(),
        "clinic_id": clinicId,
        "clinicData": clinicData!.toJson(),
        "email": email,
        "lastName": lastName,
        "firstName": firstName,
      };
}

class ClinicData {
  ClinicData({
    this.id,
    this.randomClinicId,
  });

  String? id;
  String? randomClinicId;

  factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
        id: json["_id"],
        randomClinicId: json["randomClinicId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "randomClinicId": randomClinicId,
      };
}

class RoleId {
  RoleId({
    this.id,
    this.roleTitle,
  });

  String? id;
  String? roleTitle;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
        id: json["_id"],
        roleTitle: json["roleTitle"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "roleTitle": roleTitle,
      };
}
