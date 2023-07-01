// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class GetAllEventsEvent extends EventEvent {}

class SearchEventsEvent extends EventEvent {
  final SearchEventBody body;
  const SearchEventsEvent({
    required this.body,
  });
}

class GetDetailEventEvent extends EventEvent {
  final int body;
  const GetDetailEventEvent({
    required this.body,
  });
}
