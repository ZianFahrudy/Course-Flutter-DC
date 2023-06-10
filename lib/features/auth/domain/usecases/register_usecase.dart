import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/auth/data/models/request/register_body.dart';
import 'package:event_app/features/auth/domain/entities/register_entity.dart';
import 'package:event_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase extends UseCase<RegisterEntity, RegisterBody> {
  RegisterUsecase(this._repository);
  final AuthRepository _repository;
  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterBody params) {
    return _repository.register(params);
  }
}
