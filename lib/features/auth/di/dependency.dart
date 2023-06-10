import 'package:event_app/core/di/injection.dart';
import 'package:event_app/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:event_app/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:event_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:event_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:event_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:event_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:event_app/features/auth/presentation/bloc/auth_bloc.dart';

class RegisterAuthModule {
  RegisterAuthModule() {
    _registerCore();
  }
  void _registerCore() {
    // datasources
    sl
      ..registerLazySingleton<AuthRemoteDatasources>(
        () => AuthRemoteDatsourcesImpl(sl()),
      )
      ..registerLazySingleton<AuthLocalDatasources>(
        () => AuthLocalDatasourcesImpl(sl()),
      )

      // repository
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl(), sl()),
      )

      // bloc
      ..registerFactory(() => AuthBloc(sl(), sl()))

      // usecase
      ..registerLazySingleton(() => LoginUsecase(sl()))
      ..registerLazySingleton(() => RegisterUsecase(sl()));
  }
}
