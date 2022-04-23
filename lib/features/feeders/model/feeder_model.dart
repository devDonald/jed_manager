// To parse this JSON data, do
//
//     final feederModel = feederModelFromJson(jsonString);

import 'dart:convert';

FeederModel feederModelFromJson(String str) =>
    FeederModel.fromJson(json.decode(str));

String feederModelToJson(FeederModel data) => json.encode(data.toJson());

class FeederModel {
  FeederModel({
    this.data,
  });

  List<Datum>? data;

  factory FeederModel.fromJson(Map<String, dynamic> json) => FeederModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  static List<FeederModel>? fromJsonList(List list) {
    return list.map((item) => FeederModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
