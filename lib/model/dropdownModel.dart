// To parse this JSON data, do
//
//     final dropdownModel = dropdownModelFromJson(jsonString);

import 'dart:convert';

DropdownModel dropdownModelFromJson(String str) =>
    DropdownModel.fromJson(json.decode(str));

String dropdownModelToJson(DropdownModel data) => json.encode(data.toJson());

class DropdownModel {
  DropdownModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory DropdownModel.fromJson(Map<String, dynamic> json) => DropdownModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.logo,
    this.clinicId,
    this.clinicName,
    this.randomClinicId,
  });

  String? logo;
  String? clinicId;
  String? clinicName;
  String? randomClinicId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        logo: json["logo"],
        clinicId: json["clinic_id"],
        clinicName: json["clinicName"],
        randomClinicId: json["randomClinicId"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "clinic_id": clinicId,
        "clinicName": clinicName,
        "randomClinicId": randomClinicId,
      };
}
