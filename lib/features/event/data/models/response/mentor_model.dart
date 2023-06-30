import 'package:event_app/features/event/domain/entities/mentor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mentor_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MentorModel extends MentorEntity {
  const MentorModel({
    required super.mentorId,
    required super.mentorName,
    required super.mentorJob,
    required super.mentorCompany,
    required super.mentorEmail,
    required super.mentorInstagram,
    required super.mentorLinkedin,
    required super.mentorAvatar,
  });

  factory MentorModel.fromJson(Map<String, dynamic> json) =>
      _$MentorModelFromJson(json);
}
