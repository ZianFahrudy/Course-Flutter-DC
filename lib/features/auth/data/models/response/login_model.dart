import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel({
    required MetaModel super.meta,
    required DataLoginModel? super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataLoginModel extends DataLoginEntity {
  const DataLoginModel({required super.token});

  factory DataLoginModel.fromJson(Map<String, dynamic> json) =>
      _$DataLoginModelFromJson(json);
}
