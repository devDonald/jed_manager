// To parse this JSON data, do
//
//     final technicianAuthResultModel = technicianAuthResultModelFromJson(jsonString);

import 'dart:convert';

TechnicianAuthResultModel technicianAuthResultModelFromJson(String str) =>
    TechnicianAuthResultModel.fromJson(json.decode(str));

String technicianAuthResultModelToJson(TechnicianAuthResultModel data) =>
    json.encode(data.toJson());

class TechnicianAuthResultModel {
  TechnicianAuthResultModel({
    this.data,
    this.token,
  });

  Data? data;
  String? token;

  factory TechnicianAuthResultModel.fromJson(Map<String, dynamic> json) =>
      TechnicianAuthResultModel(
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "token": token,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.technicianId,
    this.email,
  });

  int? id;
  String? name;
  String? phone;
  String? technicianId;
  String? email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        technicianId: json["technician_id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "technician_id": technicianId,
        "email": email,
      };
}
