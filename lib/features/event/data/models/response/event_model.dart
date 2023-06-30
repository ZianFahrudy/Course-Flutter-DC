import 'package:event_app/features/event/data/models/response/mentor_model.dart';
import 'package:event_app/features/event/domain/entities/event_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EventModel extends EventEntity {
  const EventModel({
    required super.eventId,
    required super.eventLabel,
    required super.eventName,
    required super.eventRoom,
    required super.eventDocumentation,
    required super.eventDate,
    required super.eventStartTime,
    required super.eventEndTime,
    required super.eventAbout,
    required super.eventDesc,
    required MentorModel super.mentor,
    required super.status,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
