import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/event/domain/entities/event_home_entity.dart';
import 'package:event_app/features/event/domain/usecases/get_all_event_usecase.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc(this.getAllEventUsecase) : super(EventInitial()) {
    on<GetAllEventsEvent>((event, emit) async {
      emit(EventLoading());

      final failureOrSuccess = await getAllEventUsecase.call(NoParams());

      failureOrSuccess.fold(
        (l) => emit(EventFailure(message: l.message)),
        (r) => emit(EventSuccess(response: r)),
      );
    });
  }

  GetAllEventUsecase getAllEventUsecase;
}
