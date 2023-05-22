// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(createFactory: false)
class LoginBody {
  final String email;
  final String password;
  LoginBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
