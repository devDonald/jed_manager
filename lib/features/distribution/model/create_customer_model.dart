// To parse this JSON data, do
//
//     final createCustomerModel = createCustomerModelFromJson(jsonString);

import 'dart:convert';

CreateCustomerModel createCustomerModelFromJson(String str) =>
    CreateCustomerModel.fromJson(json.decode(str));

String createCustomerModelToJson(CreateCustomerModel data) =>
    json.encode(data.toJson());

class CreateCustomerModel {
  CreateCustomerModel({
    this.accountNumber,
    this.name,
    this.address,
    this.email,
    this.statusId,
    this.areaOfficeId,
    this.band,
    this.feederId,
    this.dtId,
    this.billStatus,
    this.receiverPhoneNumber,
    this.lastPaymentDate,
    this.lastPaymentAmount,
    this.longitude,
    this.latitude,
  });

  String? accountNumber;
  String? name;
  String? address;
  String? email;
  String? statusId;
  String? areaOfficeId;
  String? band;
  String? feederId;
  String? dtId;
  int? billStatus;
  String? receiverPhoneNumber;
  String? lastPaymentDate;
  String? lastPaymentAmount;
  String? longitude;
  String? latitude;

  factory CreateCustomerModel.fromJson(Map<String, dynamic> json) =>
      CreateCustomerModel(
        accountNumber: json["account_number"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        statusId: json["status_id"],
        areaOfficeId: json["area_office_id"],
        band: json["band"],
        feederId: json["feeder_id"],
        dtId: json["dt_id"],
        billStatus: json["bill_status"],
        receiverPhoneNumber: json["receiver_phone_number"],
        lastPaymentDate: json["last_payment_date"],
        lastPaymentAmount: json["last_payment_amount"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "name": name,
        "address": address,
        "email": email,
        "status_id": statusId,
        "area_office_id": areaOfficeId,
        "band": band,
        "feeder_id": feederId,
        "dt_id": dtId,
        "bill_status": billStatus,
        "receiver_phone_number": receiverPhoneNumber,
        "last_payment_date": lastPaymentDate,
        "last_payment_amount": lastPaymentAmount,
        "longitude": longitude,
        "latitude": latitude,
      };
}
