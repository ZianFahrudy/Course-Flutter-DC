import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';
import 'package:event_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);
  final AuthRepository _repository;
  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.login(params);
  }
}
