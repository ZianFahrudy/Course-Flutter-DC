// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      eventId: json['event_id'] as String,
      eventLabel: json['event_label'] as String,
      eventName: json['event_name'] as String,
      eventRoom: json['event_room'] as String,
      eventDocumentation: json['event_documentation'] as String,
      eventDate: json['event_date'] as String,
      eventStartTime: json['event_start_time'] as String,
      eventEndTime: json['event_end_time'] as String,
      eventAbout: json['event_about'] as String,
      eventDesc: json['event_desc'] as String,
      mentor: MentorModel.fromJson(json['mentor'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
