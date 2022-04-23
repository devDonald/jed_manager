// To parse this JSON data, do
//
//     final updateCustomerModel = updateCustomerModelFromJson(jsonString);

import 'dart:convert';

UpdateCustomerModel updateCustomerModelFromJson(String str) =>
    UpdateCustomerModel.fromJson(json.decode(str));

String updateCustomerModelToJson(UpdateCustomerModel data) =>
    json.encode(data.toJson());

class UpdateCustomerModel {
  UpdateCustomerModel({
    this.feederId,
    this.billStatus,
    this.dtId,
    this.receiverPhoneNumber,
    this.longitude,
    this.latitude,
  });

  String? feederId;
  int? billStatus;
  int? dtId;
  String? receiverPhoneNumber;
  String? latitude, longitude;

  factory UpdateCustomerModel.fromJson(Map<String, dynamic> json) =>
      UpdateCustomerModel(
        feederId: json["feeder_id"],
        billStatus: json["bill_status"],
        receiverPhoneNumber: json["receiver_phone_number"],
        dtId: json["dt_id"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "feeder_id": feederId,
        "bill_status": billStatus,
        "receiver_phone_number": receiverPhoneNumber,
        "longitude": longitude,
        "dt_id": dtId,
        "latitude": latitude,
      };
}
