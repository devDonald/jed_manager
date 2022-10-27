// To parse this JSON data, do
//
//     final updateFaultModel = updateFaultModelFromJson(jsonString);

import 'dart:convert';

UpdateFaultModel updateFaultModelFromJson(String str) =>
    UpdateFaultModel.fromJson(json.decode(str));

String updateFaultModelToJson(UpdateFaultModel data) =>
    json.encode(data.toJson());

class UpdateFaultModel {
  UpdateFaultModel(
      {this.statusId,
      this.description,
      this.longitude,
      this.latitude,
      this.resolvedAddress});

  int? statusId;
  String? description;
  String? longitude;
  String? latitude;
  String? resolvedAddress;

  factory UpdateFaultModel.fromJson(Map<String, dynamic> json) =>
      UpdateFaultModel(
        statusId: json["status_id"],
        description: json["description"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        resolvedAddress: json["resolved_address"],
      );

  Map<String, dynamic> toJson() => {
        "status_id": statusId,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "resolved_address": resolvedAddress,
      };
}
