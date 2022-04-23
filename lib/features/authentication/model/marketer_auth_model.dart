// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

MarketerAuthModel authModelFromJson(String str) =>
    MarketerAuthModel.fromJson(json.decode(str));

String authModelToJson(MarketerAuthModel data) => json.encode(data.toJson());

class MarketerAuthModel {
  MarketerAuthModel({
    this.marketerId,
    this.password,
    this.longitude,
    this.latitude,
  });

  String? marketerId;
  String? password;
  String? longitude;
  String? latitude;

  factory MarketerAuthModel.fromJson(Map<String, dynamic> json) =>
      MarketerAuthModel(
        marketerId: json["marketer_id"],
        password: json["password"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "marketer_id": marketerId,
        "password": password,
        "longitude": longitude,
        "latitude": latitude,
      };
}
