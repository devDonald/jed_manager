// To parse this JSON data, do
//
//     final technicianLoginModel = technicianLoginModelFromJson(jsonString);

import 'dart:convert';

TechnicianLoginModel technicianLoginModelFromJson(String str) =>
    TechnicianLoginModel.fromJson(json.decode(str));

String technicianLoginModelToJson(TechnicianLoginModel data) =>
    json.encode(data.toJson());

class TechnicianLoginModel {
  TechnicianLoginModel({
    this.technicianId,
    this.password,
    this.longitude,
    this.latitude,
    this.resolvedAddress,
  });

  String? technicianId;
  String? password;
  String? longitude;
  String? latitude;
  String? resolvedAddress;

  factory TechnicianLoginModel.fromJson(Map<String, dynamic> json) =>
      TechnicianLoginModel(
        technicianId: json["technician_id"],
        password: json["password"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        resolvedAddress: json["resolved_address"],
      );

  Map<String, dynamic> toJson() => {
        "technician_id": technicianId,
        "password": password,
        "longitude": longitude,
        "latitude": latitude,
        "resolved_address": resolvedAddress,
      };
}
