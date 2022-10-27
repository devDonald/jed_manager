// To parse this JSON data, do
//
//     final getFaultModel = getFaultModelFromJson(jsonString);

import 'dart:convert';

GetFaultModel getFaultModelFromJson(String str) =>
    GetFaultModel.fromJson(json.decode(str));

String getFaultModelToJson(GetFaultModel data) => json.encode(data.toJson());

class GetFaultModel {
  GetFaultModel({
    this.data,
  });

  List<Datum>? data;

  factory GetFaultModel.fromJson(Map<String, dynamic> json) => GetFaultModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.status,
    this.faults,
    this.description,
    this.statusId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  Status? status;
  Faults? faults;
  String? description;
  int? statusId;
  String? createdAt;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: Status.fromJson(json["status"]),
        faults: Faults.fromJson(json["faults"]),
        description: json["description"],
        statusId: json["status_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "faults": faults,
        "description": description,
        "status_id": statusId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Faults {
  Faults({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Faults.fromJson(Map<String, dynamic> json) => Faults(
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

  String? createdAt;
  String? updatedAt;
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
