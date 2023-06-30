// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginBody body;
  const LoginEvent({
    required this.body,
  });
}

class RegisterEvent extends AuthEvent {
  final RegisterBody body;
  const RegisterEvent({
    required this.body,
  });
}

class GetProfileMemberEvent extends AuthEvent {}
