// To parse this JSON data, do
//
//     final updateBillModel = updateBillModelFromJson(jsonString);

import 'dart:convert';

UpdateBillModel updateBillModelFromJson(String str) =>
    UpdateBillModel.fromJson(json.decode(str));

String updateBillModelToJson(UpdateBillModel data) =>
    json.encode(data.toJson());

class UpdateBillModel {
  UpdateBillModel({
    this.statusId,
    this.amount,
    this.longitude,
    this.latitude,
    this.resolvedAddress,
  });

  int? statusId;
  int? amount;
  String? longitude;
  String? latitude;
  String? resolvedAddress;

  factory UpdateBillModel.fromJson(Map<String, dynamic> json) =>
      UpdateBillModel(
        statusId: json["status_id"],
        amount: json["amount"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        resolvedAddress: json["resolved_address"],
      );

  Map<String, dynamic> toJson() => {
        "status_id": statusId,
        "amount": amount,
        "longitude": longitude,
        "latitude": latitude,
        "resolved_address": resolvedAddress,
      };
}
