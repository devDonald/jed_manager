// To parse this JSON data, do
//
//     final newCustomerModel = newCustomerModelFromJson(jsonString);

import 'dart:convert';

NewCustomerModel newCustomerModelFromJson(String str) =>
    NewCustomerModel.fromJson(json.decode(str));

String newCustomerModelToJson(NewCustomerModel data) =>
    json.encode(data.toJson());

class NewCustomerModel {
  NewCustomerModel({
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
    this.resolvedAddress,
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
  String? billStatus;
  String? receiverPhoneNumber;
  String? lastPaymentDate;
  int? lastPaymentAmount;
  String? longitude;
  String? latitude;
  String? resolvedAddress;

  factory NewCustomerModel.fromJson(Map<String, dynamic> json) =>
      NewCustomerModel(
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
        resolvedAddress: json["resolved_address"],
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
        "resolved_address": resolvedAddress,
      };
}
