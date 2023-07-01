// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/event/data/models/request/search_event_body.dart';
import 'package:event_app/features/event/domain/entities/event_detail_entity.dart';
import 'package:event_app/features/event/domain/entities/event_home_entity.dart';

abstract class EventRepository {
  Future<Either<Failure, EventHomeEntity>> getAllEvent();
  Future<Either<Failure, EventHomeEntity>> getEventBySearch(
    SearchEventBody body,
  );
  Future<Either<Failure, EventDetailEntity>> getDetailEvent(int body);
}
