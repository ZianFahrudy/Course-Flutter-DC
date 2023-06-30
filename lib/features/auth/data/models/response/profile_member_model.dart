import 'package:event_app/common/models/meta_model.dart';
import 'package:event_app/features/auth/data/models/response/member_model.dart';
import 'package:event_app/features/auth/domain/entities/profile_member_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_member_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileMemberModel extends ProfileMemberEntity {
  const ProfileMemberModel({
    required MetaModel super.meta,
    required MemberModel super.data,
  });

  factory ProfileMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileMemberModelFromJson(json);
}
