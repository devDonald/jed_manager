// To parse this JSON data, do
//
//     final areaOfficeModel = areaOfficeModelFromJson(jsonString);

import 'dart:convert';

AreaOfficeModel areaOfficeModelFromJson(String str) =>
    AreaOfficeModel.fromJson(json.decode(str));

String areaOfficeModelToJson(AreaOfficeModel data) =>
    json.encode(data.toJson());

class AreaOfficeModel {
  AreaOfficeModel({
    this.data,
  });

  List<Datum>? data;

  factory AreaOfficeModel.fromJson(Map<String, dynamic> json) =>
      AreaOfficeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
