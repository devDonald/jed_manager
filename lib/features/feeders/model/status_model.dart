// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  StatusModel({
    this.data,
  });

  List<Datum>? data;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.style,
  });

  String createdAt;
  String updatedAt;
  int id;
  String name;
  String style;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        id: json["id"],
        name: json["name"],
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id": id,
        "name": name,
        "style": style,
      };
}
