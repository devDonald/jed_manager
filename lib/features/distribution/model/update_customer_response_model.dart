// To parse this JSON data, do
//
//     final updateResponseModel = updateResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateResponseModel updateResponseModelFromJson(String str) =>
    UpdateResponseModel.fromJson(json.decode(str));

String updateResponseModelToJson(UpdateResponseModel data) =>
    json.encode(data.toJson());

class UpdateResponseModel {
  UpdateResponseModel({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory UpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateResponseModel(
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
  });

  int? id;
  String? name;
  dynamic email;
  String? address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
      };
}
