// To parse this JSON data, do
//
//     final faultReportModel = faultReportModelFromJson(jsonString);

import 'dart:convert';

FaultReportModel faultReportModelFromJson(String str) =>
    FaultReportModel.fromJson(json.decode(str));

String faultReportModelToJson(FaultReportModel data) =>
    json.encode(data.toJson());

class FaultReportModel {
  FaultReportModel({
    this.name,
    this.phone,
    this.address,
    this.description,
    this.feederId,
    this.dtId,
    this.statusId,
    this.longitude,
    this.latitude,
  });

  String? name;
  String? phone;
  String? address;
  String? description;
  int? feederId;
  int? dtId;
  int? statusId;
  String? longitude;
  String? latitude;

  factory FaultReportModel.fromJson(Map<String, dynamic> json) =>
      FaultReportModel(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        description: json["description"],
        feederId: json["feeder_id"],
        dtId: json["dt_id"],
        statusId: json["status_id"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "description": description,
        "feeder_id": feederId,
        "dt_id": dtId,
        "status_id": statusId,
        "longitude": longitude,
        "latitude": latitude,
      };
}
