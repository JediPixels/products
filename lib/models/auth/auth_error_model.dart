import 'dart:convert';

class AuthErrorModel {
  AuthErrorModel({
    required this.message,
  });

  String message;

  factory AuthErrorModel.fromRawJson(String str) => AuthErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) => AuthErrorModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

// JSON
/*
{
  "message":"Invalid credentials"
}
*/