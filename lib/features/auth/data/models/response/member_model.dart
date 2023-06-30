import 'package:event_app/features/auth/domain/entities/member_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MemberModel extends MemberEntity {
  const MemberModel({
    required super.memberId,
    required super.memberName,
    required super.memberJob,
    required super.memberCompany,
    required super.memberEmail,
    required super.memberPassword,
    required super.memberInstagram,
    required super.memberLinkedin,
    required super.memberAvatar,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
