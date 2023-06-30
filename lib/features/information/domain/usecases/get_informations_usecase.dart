import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';

import 'package:event_app/features/information/domain/entities/information_response_entity.dart';
import 'package:event_app/features/information/domain/repositories/information_repository.dart';

class GetInformationsUsecase
    extends UseCase<InformationResponseEntity, NoParams> {
  GetInformationsUsecase(this._repository);
  final InformationRepository _repository;
  @override
  Future<Either<Failure, InformationResponseEntity>> call(NoParams params) {
    return _repository.getAllInformation();
  }
}
