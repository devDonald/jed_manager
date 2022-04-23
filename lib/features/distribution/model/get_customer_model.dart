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
  String? email;
  String? address;
  String? accountNumber;
  String? lastPaymentDate;
  String? lastPaymentAmount;
  String? phone;
  String? band;
  Feeder? feeder;
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
        feeder: Feeder.fromJson(json["feeder"]),
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
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.style,
  });

  int id;
  String name;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  String style;

  factory AreaOffice.fromJson(Map<String, dynamic> json) => AreaOffice(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "style": style,
      };
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.style,
  });

  int id;
  String name;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  String style;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "style": style,
      };
}

class Feeder {
  Feeder({
    this.id,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.feederParentId,
    this.statusId,
  });

  int? id;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? feederParentId;
  int? statusId;

  factory Feeder.fromJson(Map<String, dynamic> json) => Feeder(
        id: json["id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        name: json["name"],
        feederParentId: json["feeder_parent_id"],
        statusId: json["status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "name": name,
        "feeder_parent_id": feederParentId,
        "status_id": statusId,
      };
}

class Dt {
  Dt({
    required this.id,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.statusId,
    required this.feederId,
    required this.name,
    required this.number,
  });

  int id;
  dynamic deletedAt, createdAt, updatedAt;
  int statusId;
  int feederId;
  String name;
  String number;

  factory Dt.fromJson(Map<String, dynamic> json) => Dt(
        id: json["id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        statusId: json["status_id"],
        feederId: json["feeder_id"],
        name: json["name"],
        number: json["number"],
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
    this.latitude,
    this.longitude,
    this.amount,
    this.amountToPay,
  });

  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic name;
  int? statusId;
  int? customerId;
  int? marketerId;
  String? receiverPhoneNumber;
  String? latitude;
  String? longitude;
  dynamic amount;
  dynamic amountToPay;

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
        latitude: json["latitude"],
        longitude: json["longitude"],
        amount: json["amount"],
        amountToPay: json["amount_to_pay"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "name": name,
        "status_id": statusId,
        "customer_id": customerId,
        "marketer_id": marketerId,
        "receiver_phone_number": receiverPhoneNumber,
        "latitude": latitude,
        "longitude": longitude,
        "amount": amount,
        "amount_to_pay": amountToPay,
      };
}
