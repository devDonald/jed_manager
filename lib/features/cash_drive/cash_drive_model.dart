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
  });

  int? statusId;
  int? amount;
  String? longitude;
  String? latitude;

  factory UpdateBillModel.fromJson(Map<String, dynamic> json) =>
      UpdateBillModel(
        statusId: json["status_id"],
        amount: json["amount"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "status_id": statusId,
        "amount": amount,
        "longitude": longitude,
        "latitude": latitude,
      };
}
