// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'information_bloc.dart';

abstract class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

class InformationInitial extends InformationState {}

class InformationLoading extends InformationState {}

class InformationFailure extends InformationState {
  final String message;
  const InformationFailure({
    required this.message,
  });
}

class InformationSuccess extends InformationState {
  final InformationResponseEntity response;
  const InformationSuccess({
    required this.response,
  });
}
