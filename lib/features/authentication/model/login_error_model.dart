// To parse this JSON data, do
//
//     final loginErrorModel = loginErrorModelFromJson(jsonString);

import 'dart:convert';

LoginErrorModel loginErrorModelFromJson(String str) =>
    LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) =>
    json.encode(data.toJson());

class LoginErrorModel {
  LoginErrorModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      LoginErrorModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
