import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  const MemberEntity({
    required this.memberId,
    required this.memberName,
    required this.memberJob,
    required this.memberCompany,
    required this.memberEmail,
    required this.memberPassword,
    required this.memberInstagram,
    required this.memberLinkedin,
    required this.memberAvatar,
  });
  final String memberId;
  final String memberName;
  final String memberJob;
  final String memberCompany;
  final String memberEmail;
  final String memberPassword;
  final String memberInstagram;
  final String memberLinkedin;
  final String memberAvatar;
  @override
  List<Object> get props {
    return [
      memberId,
      memberName,
      memberJob,
      memberCompany,
      memberEmail,
      memberPassword,
      memberInstagram,
      memberLinkedin,
      memberAvatar,
    ];
  }
}
