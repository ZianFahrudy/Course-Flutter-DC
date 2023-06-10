import 'package:dio/dio.dart';
import 'package:event_app/core/constants/key_constant.dart';
import 'package:event_app/core/env/env_config.dart';
import 'package:event_app/core/prefs/shared_prefs.dart';
import 'package:event_app/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  DioHandler({required this.config, required this.preferences});

  final EnvConfig config;
  final SharedPrefs preferences;

  Dio get dio => _getDio();

  Dio _getDio() {
    final header = <String, dynamic>{
      'isToken': preferences.isKeyExists(KeyConstant.token)
    };

    final options = BaseOptions(
      baseUrl: config.apiBaseUrl ?? '',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      receiveDataWhenStatusError: true,
      headers: header,
    );

    final dio = Dio(options);

    dio.interceptors.addAll(<Interceptor>[
      _loggingInterceptor(),
      _queuedInterceptorsWrapper(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    ]);

    return dio;
  }

  QueuedInterceptorsWrapper _queuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onResponse: (response, handler) {
        return handler.resolve(response);
      },
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response!.statusCode == 401) {
          await preferences.clearAll();
          await Get.offAllNamed<void>(RoutesName.loginPage);
        } else {
          return handler.next(error);
        }
      },
    );
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = preferences.getString(KeyConstant.token);

        final headers = {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        };

        if (options.headers.containsKey('isToken')) {
          options.headers.remove('isToken');
          options.headers.addAll(headers);
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        return handler.next(error);
      },
    );
  }
}
