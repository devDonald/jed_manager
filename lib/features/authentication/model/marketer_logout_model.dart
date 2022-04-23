// To parse this JSON data, do
//
//     final marketerLogoutModel = marketerLogoutModelFromJson(jsonString);

import 'dart:convert';

MarketerLogoutModel marketerLogoutModelFromJson(String str) =>
    MarketerLogoutModel.fromJson(json.decode(str));

String marketerLogoutModelToJson(MarketerLogoutModel data) =>
    json.encode(data.toJson());

class MarketerLogoutModel {
  MarketerLogoutModel({
    this.longitude,
    this.latitude,
  });

  String? longitude;
  String? latitude;

  factory MarketerLogoutModel.fromJson(Map<String, dynamic> json) =>
      MarketerLogoutModel(
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}
