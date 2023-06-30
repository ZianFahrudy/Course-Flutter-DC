// ignore_for_file: avoid_dynamic_calls

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/information/data/datasources/information_remote_datasource.dart';
import 'package:event_app/features/information/domain/entities/information_response_entity.dart';
import 'package:event_app/features/information/domain/repositories/information_repository.dart';

class InformationRepositoryImpl implements InformationRepository {
  InformationRepositoryImpl(this.remoteDatasources);
  final InformationRemoteDatasources remoteDatasources;
  @override
  Future<Either<Failure, InformationResponseEntity>> getAllInformation() async {
    try {
      final remoteLogin = await remoteDatasources.getAllInformation();

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
