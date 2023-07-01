// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:event_app/features/event/domain/entities/mentor_entity.dart';

class EventEntity extends Equatable {
  final String eventId;
  final String eventLabel;
  final String eventName;
  final String eventRoom;
  final String eventDocumentation;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventAbout;
  final String eventDesc;
  final MentorEntity mentor;
  final String status;
  final String isJoin;
  final String attend;
  const EventEntity({
    required this.eventId,
    required this.eventLabel,
    required this.eventName,
    required this.eventRoom,
    required this.eventDocumentation,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventAbout,
    required this.eventDesc,
    required this.mentor,
    required this.status,
    required this.isJoin,
    required this.attend,
  });
  @override
  List<Object> get props {
    return [
      eventId,
      eventLabel,
      eventName,
      eventRoom,
      eventDocumentation,
      eventDate,
      eventStartTime,
      eventEndTime,
      eventAbout,
      eventDesc,
      mentor,
      status,
      isJoin,
      attend
    ];
  }
}
