// To parse this JSON data, do
//
//     final marketerAuthModel = marketerAuthModelFromJson(jsonString);

import 'dart:convert';

MarketerAuthModel marketerAuthModelFromJson(String str) =>
    MarketerAuthModel.fromJson(json.decode(str));

String marketerAuthModelToJson(MarketerAuthModel data) =>
    json.encode(data.toJson());

class MarketerAuthModel {
  MarketerAuthModel({
    this.marketerId,
    this.password,
    this.longitude,
    this.latitude,
    this.resolvedAddress,
  });

  String? marketerId;
  String? password;
  String? longitude;
  String? latitude;
  String? resolvedAddress;

  factory MarketerAuthModel.fromJson(Map<String, dynamic> json) =>
      MarketerAuthModel(
        marketerId: json["marketer_id"],
        password: json["password"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        resolvedAddress: json["resolved_address"],
      );

  Map<String, dynamic> toJson() => {
        "marketer_id": marketerId,
        "password": password,
        "longitude": longitude,
        "latitude": latitude,
        "resolved_address": resolvedAddress,
      };
}
