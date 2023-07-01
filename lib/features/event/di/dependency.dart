import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/event/data/datasources/event_remote_datasource.dart';
import 'package:event_app/features/event/data/repositories/event_repository_impl.dart';
import 'package:event_app/features/event/domain/repositories/event_repository.dart';
import 'package:event_app/features/event/domain/usecases/get_all_event_usecase.dart';
import 'package:event_app/features/event/domain/usecases/get_detail_event_usecase.dart';
import 'package:event_app/features/event/domain/usecases/search_event_usecase.dart';
import 'package:event_app/features/event/presentation/bloc/event_bloc.dart';

class RegisterEventModule {
  RegisterEventModule() {
    _registerCore();
  }
  void _registerCore() {
    // datasources
    sl
      ..registerLazySingleton<EventRemoteDatasources>(
        () => EventRemoteDatasourcesImpl(sl()),
      )

      // repository
      ..registerLazySingleton<EventRepository>(
        () => EventRepositoryImpl(sl()),
      )

      // bloc
      ..registerFactory(() => EventBloc(sl(), sl(), sl()))

      // usecase
      ..registerLazySingleton(() => SearchEventUsecase(sl()))
      ..registerLazySingleton(() => GetDetailEventUsecase(sl()))
      ..registerLazySingleton(() => GetAllEventUsecase(sl()));
  }
}
