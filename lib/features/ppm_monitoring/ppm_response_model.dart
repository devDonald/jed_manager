// To parse this JSON data, do
//
//     final ppmRespnseModel = ppmRespnseModelFromJson(jsonString);

import 'dart:convert';

PpmRespnseModel ppmRespnseModelFromJson(String str) =>
    PpmRespnseModel.fromJson(json.decode(str));

String ppmRespnseModelToJson(PpmRespnseModel data) =>
    json.encode(data.toJson());

class PpmRespnseModel {
  PpmRespnseModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory PpmRespnseModel.fromJson(Map<String, dynamic> json) =>
      PpmRespnseModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.band,
    this.customerPhone,
    this.customerAddress,
    this.meterSerialNumber,
  });

  int? id;
  dynamic band;
  dynamic customerPhone;
  dynamic customerAddress;
  String? meterSerialNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        band: json["band"],
        customerPhone: json["customer_phone"],
        customerAddress: json["customer_address"],
        meterSerialNumber: json["meter_serial_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "band": band,
        "customer_phone": customerPhone,
        "customer_address": customerAddress,
        "meter_serial_number": meterSerialNumber,
      };
}
