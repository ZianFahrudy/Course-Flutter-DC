import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';
import 'package:event_app/features/auth/domain/entities/register_entity.dart';

import 'package:event_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:event_app/features/auth/domain/usecases/register_usecase.dart';

import '../../data/models/request/register_body.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUsecase, this.registerUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final response = await loginUsecase.call(event.body);

      response.fold(
        (error) => emit(AuthFailure(message: error.message)),
        (data) => emit(AuthSuccess(response: data)),
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());

      final response = await registerUsecase.call(event.body);

      response.fold(
        (error) => emit(AuthFailure(message: error.message)),
        (data) => emit(RegisterSuccess(response: data)),
      );
    });
  }

  LoginUsecase loginUsecase;
  RegisterUsecase registerUsecase;
}
