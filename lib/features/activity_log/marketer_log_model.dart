// To parse this JSON data, do
//
//     final marketerLogModel = marketerLogModelFromJson(jsonString);

import 'dart:convert';

MarketerLogModel marketerLogModelFromJson(String str) =>
    MarketerLogModel.fromJson(json.decode(str));

String marketerLogModelToJson(MarketerLogModel data) =>
    json.encode(data.toJson());

class MarketerLogModel {
  MarketerLogModel({
    this.data,
  });

  List<Datum>? data;

  factory MarketerLogModel.fromJson(Map<String, dynamic> json) =>
      MarketerLogModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.activityType,
    this.resolvedAddress,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  ActivityType? activityType;
  String? resolvedAddress;
  String? createdAt;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        activityType: ActivityType.fromJson(json["activity_type"]),
        resolvedAddress: json["resolved_address"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_type": activityType!.toJson(),
        "resolved_address": resolvedAddress,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class ActivityType {
  ActivityType({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.description,
  });

  int? id;
  String? name;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? description;

  factory ActivityType.fromJson(Map<String, dynamic> json) => ActivityType(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "description": description,
      };
}
