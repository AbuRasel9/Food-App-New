// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? phone;
  String? email;
  String? password;

  LoginRequest({
    this.phone,
    this.email,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "email": email,
    "password": password,
  };
}
