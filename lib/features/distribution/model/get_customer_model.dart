// To parse this JSON data, do
//
//     final getCustomerModel = getCustomerModelFromJson(jsonString);

import 'dart:convert';

GetCustomerModel getCustomerModelFromJson(String str) =>
    GetCustomerModel.fromJson(json.decode(str));

String getCustomerModelToJson(GetCustomerModel data) =>
    json.encode(data.toJson());

class GetCustomerModel {
  GetCustomerModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory GetCustomerModel.fromJson(Map<String, dynamic> json) =>
      GetCustomerModel(
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
    this.name,
    this.email,
    this.address,
    this.accountNumber,
    this.lastPaymentDate,
    this.lastPaymentAmount,
    this.phone,
    this.band,
    this.feeder,
    this.dt,
    this.status,
    this.areaOffice,
    this.unpaidBills,
  });

  int? id;
  String? name;
  dynamic email;
  String? address;
  String? accountNumber;
  dynamic lastPaymentDate;
  dynamic lastPaymentAmount;
  dynamic phone;
  String? band;
  Dt? feeder;
  Dt? dt;
  Status? status;
  AreaOffice? areaOffice;
  List<UnpaidBill>? unpaidBills;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        accountNumber: json["account_number"],
        lastPaymentDate: json["last_payment_date"],
        lastPaymentAmount: json["last_payment_amount"],
        phone: json["phone"],
        band: json["band"],
        feeder: Dt.fromJson(json["feeder"]),
        dt: Dt.fromJson(json["dt"]),
        status: Status.fromJson(json["status"]),
        areaOffice: AreaOffice.fromJson(json["area_office"]),
        unpaidBills: List<UnpaidBill>.from(
            json["Unpaid_Bills"].map((x) => UnpaidBill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "account_number": accountNumber,
        "last_payment_date": lastPaymentDate,
        "last_payment_amount": lastPaymentAmount,
        "phone": phone,
        "band": band,
        "feeder": feeder!.toJson(),
        "dt": dt!.toJson(),
        "status": status!.toJson(),
        "area_office": areaOffice!.toJson(),
        "Unpaid_Bills": List<dynamic>.from(unpaidBills!.map((x) => x.toJson())),
      };
}

class AreaOffice {
  AreaOffice({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

  factory AreaOffice.fromJson(Map<String, dynamic> json) => AreaOffice(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Dt {
  Dt({
    this.id,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.statusId,
    this.feederId,
    this.name,
    this.number,
    this.parentFeederId,
  });

  int? id;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  int? statusId;
  int? feederId;
  String? name;
  String? number;
  int? parentFeederId;

  factory Dt.fromJson(Map<String, dynamic> json) => Dt(
        id: json["id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        statusId: json["status_id"],
        feederId: json["feeder_id"],
        name: json["name"],
        number: json["number"],
        parentFeederId: json["parent_feeder_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status_id": statusId,
        "feeder_id": feederId,
        "name": name,
        "number": number,
        "parent_feeder_id": parentFeederId,
      };
}

class Status {
  Status({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.style,
    this.color,
    this.tag,
  });

  dynamic createdAt;
  dynamic updatedAt;
  int? id;
  String? name;
  String? style;
  String? color;
  String? tag;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        id: json["id"],
        name: json["name"],
        style: json["style"],
        color: json["color"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id": id,
        "name": name,
        "style": style,
        "color": color,
        "tag": tag,
      };
}

class UnpaidBill {
  UnpaidBill({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.statusId,
    this.customerId,
    this.marketerId,
    this.receiverPhoneNumber,
    this.description,
    this.month,
    this.year,
    this.latitude,
    this.longitude,
    this.amount,
    this.amountToPay,
    this.resolvedAddress,
    this.status,
  });

  int? id;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic name;
  int? statusId;
  int? customerId;
  dynamic marketerId;
  String? receiverPhoneNumber;
  dynamic description;
  String? month;
  String? year;
  String? latitude;
  String? longitude;
  String? amount;
  String? amountToPay;
  dynamic resolvedAddress;
  Status? status;

  factory UnpaidBill.fromJson(Map<String, dynamic> json) => UnpaidBill(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        name: json["name"],
        statusId: json["status_id"],
        customerId: json["customer_id"],
        marketerId: json["marketer_id"],
        receiverPhoneNumber: json["receiver_phone_number"],
        description: json["description"],
        month: json["month"],
        year: json["year"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        amount: json["amount"],
        amountToPay: json["amount_to_pay"],
        resolvedAddress: json["resolved_address"],
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "name": name,
        "status_id": statusId,
        "customer_id": customerId,
        "marketer_id": marketerId,
        "receiver_phone_number": receiverPhoneNumber,
        "description": description,
        "month": month,
        "year": year,
        "latitude": latitude,
        "longitude": longitude,
        "amount": amount,
        "amount_to_pay": amountToPay,
        "resolved_address": resolvedAddress,
        "status": status!.toJson(),
      };
}
