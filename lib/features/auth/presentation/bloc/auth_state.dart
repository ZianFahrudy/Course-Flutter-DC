// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginEntity response;
  const AuthSuccess({
    required this.response,
  });
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure({
    required this.message,
  });
}

class RegisterSuccess extends AuthState {
  final RegisterEntity response;
  const RegisterSuccess({
    required this.response,
  });
}

class ProfilMemberSuccess extends AuthState {
  final ProfileMemberEntity response;
  const ProfilMemberSuccess({
    required this.response,
  });
}
