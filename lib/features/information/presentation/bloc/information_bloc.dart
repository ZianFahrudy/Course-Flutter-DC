import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:event_app/common/usecase/use_case.dart';
import 'package:event_app/features/information/domain/entities/information_response_entity.dart';
import 'package:event_app/features/information/domain/usecases/get_informations_usecase.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc(this.getInformationsUsecase) : super(InformationInitial()) {
    on<InformationEvent>((event, emit) async {
      emit(InformationLoading());

      final failureOrSuccess = await getInformationsUsecase.call(NoParams());
      failureOrSuccess.fold(
        (l) => emit(InformationFailure(message: l.message)),
        (r) => emit(InformationSuccess(response: r)),
      );
    });
  }

  GetInformationsUsecase getInformationsUsecase;
}
