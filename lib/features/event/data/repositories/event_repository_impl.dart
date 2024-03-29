// ignore_for_file: avoid_dynamic_calls

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/event/data/datasources/event_remote_datasource.dart';
import 'package:event_app/features/event/data/models/request/search_event_body.dart';
import 'package:event_app/features/event/domain/entities/event_detail_entity.dart';
import 'package:event_app/features/event/domain/entities/event_home_entity.dart';
import 'package:event_app/features/event/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl(this.remoteDatasources);
  final EventRemoteDatasources remoteDatasources;
  @override
  Future<Either<Failure, EventHomeEntity>> getAllEvent() async {
    try {
      final remoteLogin = await remoteDatasources.getAllEvent();

      return Right(remoteLogin);
    } on DioError catch (e) {
      return Left(
        ServerFailure(e.response!.data['meta']['message'] as String),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventHomeEntity>> getEventBySearch(
    SearchEventBody body,
  ) async {
    try {
      final remoteLogin = await remoteDatasources.getEventBySearch(body);

      return Right(remoteLogin);
    } on DioError catch (e) {
      return Left(
        ServerFailure(e.response!.data['meta']['message'] as String),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventDetailEntity>> getDetailEvent(int body) async {
    try {
      final remoteLogin = await remoteDatasources.getDetailEvent(body);

      return Right(remoteLogin);
    } on DioError catch (e) {
      return Left(
        ServerFailure(e.response!.data['meta']['message'] as String),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
