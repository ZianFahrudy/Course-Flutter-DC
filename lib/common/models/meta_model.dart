import 'package:event_app/common/models/meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable(createToJson: false)
class MetaModel extends MetaEntity {
  const MetaModel({required super.message, required super.code});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
