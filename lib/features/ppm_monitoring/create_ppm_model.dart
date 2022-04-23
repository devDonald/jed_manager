// To parse this JSON data, do
//
//     final createPpmModel = createPpmModelFromJson(jsonString);

import 'dart:convert';

CreatePpmModel createPpmModelFromJson(String str) =>
    CreatePpmModel.fromJson(json.decode(str));

String createPpmModelToJson(CreatePpmModel data) => json.encode(data.toJson());

class CreatePpmModel {
  CreatePpmModel({
    this.dtId,
    this.feederId,
    this.meterSerialNumber,
    this.phone,
    this.address,
    this.band,
    this.longitude,
    this.latitude,
    this.lastVendingDate,
    this.statusId,
  });

  int? dtId;
  int? feederId, statusId;
  String? meterSerialNumber, lastVendingDate;
  String? phone;
  String? address;
  String? band;
  String? longitude;
  String? latitude;

  factory CreatePpmModel.fromJson(Map<String, dynamic> json) => CreatePpmModel(
      dtId: json["dt_id"],
      feederId: json["feeder_id"],
      meterSerialNumber: json["meter_serial_number"],
      phone: json["phone"],
      address: json["address"],
      band: json["band"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      statusId: json["status_id"],
      lastVendingDate: json["last_date_of_vending"]);

  Map<String, dynamic> toJson() => {
        "dt_id": dtId,
        "feeder_id": feederId,
        "meter_serial_number": meterSerialNumber,
        "customer_phone": phone,
        "customer_address": address,
        "address": address,
        "band": band,
        "longitude": longitude,
        "latitude": latitude,
        "status_id": statusId,
        "last_date_of_vending": lastVendingDate
      };
}
