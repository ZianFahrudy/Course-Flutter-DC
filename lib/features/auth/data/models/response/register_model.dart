import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/auth/domain/entities/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(createToJson: false)
class RegisterModel extends RegisterEntity {
  const RegisterModel({required MetaModel super.meta});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
