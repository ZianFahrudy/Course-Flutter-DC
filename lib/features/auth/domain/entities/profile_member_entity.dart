import 'package:equatable/equatable.dart';
import 'package:event_app/common/models/meta_entity.dart';
import 'package:event_app/features/auth/domain/entities/member_entity.dart';

class ProfileMemberEntity extends Equatable {
  const ProfileMemberEntity({
    required this.meta,
    required this.data,
  });
  final MetaEntity meta;
  final MemberEntity data;

  @override
  List<Object> get props => [meta, data];
}
