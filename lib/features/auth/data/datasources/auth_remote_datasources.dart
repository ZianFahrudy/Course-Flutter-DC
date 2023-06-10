// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:event_app/common/error/exception.dart';
import 'package:event_app/core/constants/api_path.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/data/models/request/register_body.dart';
import 'package:event_app/features/auth/data/models/response/login_model.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';
import 'package:event_app/features/auth/domain/entities/register_entity.dart';

import '../models/response/register_model.dart';

abstract class AuthRemoteDatasources {
  Future<LoginEntity> login(LoginBody body);
  Future<RegisterEntity> register(RegisterBody body);
}

class AuthRemoteDatsourcesImpl implements AuthRemoteDatasources {
  AuthRemoteDatsourcesImpl(this._client);
  final Dio _client;
  @override
  Future<LoginEntity> login(LoginBody body) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        ApiPath.login,
        data: body.toJson(),
      );

      return LoginModel.fromJson(response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<RegisterEntity> register(RegisterBody body) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        ApiPath.register,
        data: body.toJson(),
      );

      return RegisterModel.fromJson(response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
