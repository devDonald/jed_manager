// To parse this JSON data, do
//
//     final dtModel = dtModelFromJson(jsonString);

import 'dart:convert';

DtModel dtModelFromJson(String str) => DtModel.fromJson(json.decode(str));

String dtModelToJson(DtModel data) => json.encode(data.toJson());

class DtModel {
  DtModel({
    this.data,
  });

  List<Datum>? data;

  factory DtModel.fromJson(Map<String, dynamic> json) => DtModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.feederId,
    required this.name,
    this.code,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int feederId;
  String name;
  dynamic code;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        feederId: json["feeder_id"],
        name: json["name"],
        code: json["code"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feeder_id": feederId,
        "name": name,
        "code": code,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
