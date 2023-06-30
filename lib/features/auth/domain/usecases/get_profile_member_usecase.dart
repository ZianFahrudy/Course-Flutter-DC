import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/auth/domain/entities/profile_member_entity.dart';
import 'package:event_app/features/auth/domain/repositories/auth_repository.dart';

class GetProfileMemberUsecase extends UseCase<ProfileMemberEntity, NoParams> {
  GetProfileMemberUsecase(this._repository);
  final AuthRepository _repository;
  @override
  Future<Either<Failure, ProfileMemberEntity>> call(NoParams params) {
    return _repository.getProfile();
  }
}
