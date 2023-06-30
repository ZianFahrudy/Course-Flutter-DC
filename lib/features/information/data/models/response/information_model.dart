import 'package:event_app/features/information/domain/entities/information_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'information_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class InformationModel extends InformationEntity {
  const InformationModel({
    required super.informationId,
    required super.informationTitle,
    required super.informationDescription,
    required super.informationDate,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      _$InformationModelFromJson(json);
}
