import 'package:event_app/core/di/injection.dart';

import 'package:event_app/features/information/data/datasources/information_remote_datasource.dart';
import 'package:event_app/features/information/data/repositories/information_repositpry_impl.dart';
import 'package:event_app/features/information/domain/repositories/information_repository.dart';
import 'package:event_app/features/information/domain/usecases/get_informations_usecase.dart';
import 'package:event_app/features/information/presentation/bloc/information_bloc.dart';

class RegisterInformationModule {
  RegisterInformationModule() {
    _registerCore();
  }
  void _registerCore() {
    // datasources
    sl
      ..registerLazySingleton<InformationRemoteDatasources>(
        () => InformationRemoteDatasourcesImpl(sl()),
      )

      // repository
      ..registerLazySingleton<InformationRepository>(
        () => InformationRepositoryImpl(sl()),
      )

      // bloc
      ..registerFactory(() => InformationBloc(sl()))

      // usecase
      ..registerLazySingleton(() => GetInformationsUsecase(sl()));
  }
}
