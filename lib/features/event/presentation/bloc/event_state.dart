// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventFailure extends EventState {
  final String message;
  const EventFailure({
    required this.message,
  });
}

class EventSuccess extends EventState {
  final EventHomeEntity response;
  const EventSuccess({
    required this.response,
  });
}

class DetailEventSuccess extends EventState {
  final EventDetailEntity response;
  const DetailEventSuccess({
    required this.response,
  });
}
