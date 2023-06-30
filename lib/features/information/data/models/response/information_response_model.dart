import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/information/data/models/response/information_model.dart';
import 'package:event_app/features/information/domain/entities/information_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'information_response_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class InformationResponseModel extends InformationResponseEntity {
  const InformationResponseModel({
    required MetaModel super.meta,
    required List<InformationModel> super.data,
  });

  factory InformationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InformationResponseModelFromJson(json);
}
