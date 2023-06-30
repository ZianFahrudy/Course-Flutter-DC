// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/information/domain/entities/information_response_entity.dart';

abstract class InformationRepository {
  Future<Either<Failure, InformationResponseEntity>> getAllInformation();
}
