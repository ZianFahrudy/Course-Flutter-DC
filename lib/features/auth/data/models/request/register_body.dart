// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
class RegisterBody {
  final String memberName;
  final String memberEmail;
  final String memberPassword;
  final String memberConfPassword;
  RegisterBody({
    required this.memberName,
    required this.memberEmail,
    required this.memberPassword,
    required this.memberConfPassword,
  });

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
