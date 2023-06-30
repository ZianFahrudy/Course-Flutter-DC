import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';

import 'package:event_app/features/event/domain/entities/event_home_entity.dart';
import 'package:event_app/features/event/domain/repositories/event_repository.dart';

class GetAllEventUsecase extends UseCase<EventHomeEntity, NoParams> {
  GetAllEventUsecase(this._repository);
  final EventRepository _repository;
  @override
  Future<Either<Failure, EventHomeEntity>> call(NoParams params) {
    return _repository.getAllEvent();
  }
}
