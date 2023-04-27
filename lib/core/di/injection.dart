import 'package:dio/dio.dart';
import 'package:event_app/core/env/env_config.dart';
import 'package:event_app/core/network/dio_handler.dart';
import 'package:event_app/core/prefs/shared_prefs.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> init() async {
    final config = EnvConfig.getInstance();
    final prefs = await SharedPrefs.getInstance();

    sl
      ..registerLazySingleton(() => prefs)
      ..registerLazySingleton(() => config!)
      ..registerLazySingleton<Dio>(() => sl<DioHandler>().dio)
      ..registerLazySingleton(
        () => DioHandler(config: sl(), preferences: sl()),
      );
  }
}
