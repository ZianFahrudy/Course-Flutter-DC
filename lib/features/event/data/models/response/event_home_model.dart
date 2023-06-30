import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/event/data/models/response/event_model.dart';
import 'package:event_app/features/event/domain/entities/event_home_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_home_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EventHomeModel extends EventHomeEntity {
  const EventHomeModel({
    required MetaModel super.meta,
    required List<EventModel> super.data,
  });

  factory EventHomeModel.fromJson(Map<String, dynamic> json) =>
      _$EventHomeModelFromJson(json);
}
