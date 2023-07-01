import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/event/data/models/request/search_event_body.dart';

import 'package:event_app/features/event/domain/entities/event_home_entity.dart';
import 'package:event_app/features/event/domain/repositories/event_repository.dart';

class SearchEventUsecase extends UseCase<EventHomeEntity, SearchEventBody> {
  SearchEventUsecase(this._repository);
  final EventRepository _repository;
  @override
  Future<Either<Failure, EventHomeEntity>> call(SearchEventBody params) {
    return _repository.getEventBySearch(params);
  }
}
