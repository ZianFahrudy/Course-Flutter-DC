// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';

import 'package:event_app/common/error/exception.dart';
import 'package:event_app/core/constants/api_path.dart';
import 'package:event_app/features/information/data/models/response/information_response_model.dart';
import 'package:event_app/features/information/domain/entities/information_response_entity.dart';

abstract class InformationRemoteDatasources {
  Future<InformationResponseEntity> getAllInformation();
}

class InformationRemoteDatasourcesImpl implements InformationRemoteDatasources {
  InformationRemoteDatasourcesImpl(this._client);
  final Dio _client;
  @override
  Future<InformationResponseEntity> getAllInformation() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.information,
      );

      return InformationResponseModel.fromJson(response.data!);
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
