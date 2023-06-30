// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MentorEntity extends Equatable {
  final String mentorId;
  final String mentorName;
  final String mentorJob;
  final String mentorCompany;
  final String mentorEmail;
  final String mentorInstagram;
  final String mentorLinkedin;
  final String mentorAvatar;
  const MentorEntity({
    required this.mentorId,
    required this.mentorName,
    required this.mentorJob,
    required this.mentorCompany,
    required this.mentorEmail,
    required this.mentorInstagram,
    required this.mentorLinkedin,
    required this.mentorAvatar,
  });
  @override
  List<Object> get props {
    return [
      mentorId,
      mentorName,
      mentorJob,
      mentorCompany,
      mentorEmail,
      mentorInstagram,
      mentorLinkedin,
      mentorAvatar,
    ];
  }
}
