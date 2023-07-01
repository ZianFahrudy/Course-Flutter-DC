import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/event/domain/entities/event_detail_entity.dart';
import 'package:event_app/features/event/domain/repositories/event_repository.dart';

class GetDetailEventUsecase extends UseCase<EventDetailEntity, int> {
  GetDetailEventUsecase(this._repository);
  final EventRepository _repository;
  @override
  Future<Either<Failure, EventDetailEntity>> call(int params) {
    return _repository.getDetailEvent(params);
  }
}
