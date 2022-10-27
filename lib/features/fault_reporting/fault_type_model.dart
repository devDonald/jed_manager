// To parse this JSON data, do
//
//     final faultTypeModel = faultTypeModelFromJson(jsonString);

import 'dart:convert';

FaultTypeModel faultTypeModelFromJson(String str) =>
    FaultTypeModel.fromJson(json.decode(str));

String faultTypeModelToJson(FaultTypeModel data) => json.encode(data.toJson());

class FaultTypeModel {
  FaultTypeModel({
    this.data,
  });

  List<Datum>? data;

  factory FaultTypeModel.fromJson(Map<String, dynamic> json) => FaultTypeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
