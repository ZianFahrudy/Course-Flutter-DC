import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/event/data/models/response/event_model.dart';
import 'package:event_app/features/event/domain/entities/event_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class EventDetailModel extends EventDetailEntity {
  const EventDetailModel({
    required MetaModel super.meta,
    required EventModel super.data,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailModelFromJson(json);
}
