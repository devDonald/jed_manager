// To parse this JSON data, do
//
//     final authResultModel = authResultModelFromJson(jsonString);

import 'dart:convert';

AuthResultModel authResultModelFromJson(String str) =>
    AuthResultModel.fromJson(json.decode(str));

String authResultModelToJson(AuthResultModel data) =>
    json.encode(data.toJson());

class AuthResultModel {
  AuthResultModel({
    this.data,
    this.token,
  });

  Data? data;
  String? token;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) =>
      AuthResultModel(
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
    this.marketerId,
    this.email,
    this.address,
    this.avatar,
    this.profileUpdateStatus,
    this.areaOffice,
  });

  int? id;
  String? name;
  dynamic phone;
  String? marketerId;
  String? email;
  String? address;
  String? avatar;
  String? profileUpdateStatus;
  AreaOffice? areaOffice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        marketerId: json["marketer_id"],
        email: json["email"],
        address: json["address"],
        avatar: json["avatar"],
        profileUpdateStatus: json["profile_update_status"],
        areaOffice: AreaOffice.fromJson(json["area_office"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "marketer_id": marketerId,
        "email": email,
        "address": address,
        "avatar": avatar,
        "profile_update_status": profileUpdateStatus,
        "area_office": areaOffice!.toJson(),
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
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AreaOffice.fromJson(Map<String, dynamic> json) => AreaOffice(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
