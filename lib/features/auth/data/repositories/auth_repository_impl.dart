// ignore_for_file: avoid_dynamic_calls

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';
import 'package:event_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDatasources);
  final AuthRemoteDatasources remoteDatasources;
  @override
  Future<Either<Failure, LoginEntity>> login(LoginBody body) async {
    try {
      final remoteLogin = await remoteDatasources.login(body);

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
