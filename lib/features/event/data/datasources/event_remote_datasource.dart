// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';

import 'package:event_app/common/error/exception.dart';
import 'package:event_app/core/constants/api_path.dart';
import 'package:event_app/features/event/data/models/response/event_home_model.dart';
import 'package:event_app/features/event/domain/entities/event_home_entity.dart';

abstract class EventRemoteDatasources {
  Future<EventHomeEntity> getAllEvent();
}

class EventRemoteDatasourcesImpl implements EventRemoteDatasources {
  EventRemoteDatasourcesImpl(this._client);
  final Dio _client;
  @override
  Future<EventHomeEntity> getAllEvent() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.event,
      );

      return EventHomeModel.fromJson(response.data!);
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
