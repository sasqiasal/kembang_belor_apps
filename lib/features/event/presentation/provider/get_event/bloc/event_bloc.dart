import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/usecase/get_event.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetEventUseCase _eventUseCase;
  EventBloc(this._eventUseCase) : super(EventInitial()) {
    on<EventFetch>(_dataFected);
  }

  void _dataFected(EventFetch event, Emitter<EventState> emit) async {
    emit(EventLoading());
    final dataState = await _eventUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(EventSucces(dataState.data!));
    } else {
      emit(const EventFailure('Tidak Ada Event'));
    }

    if (dataState is DataFailed) {
      emit(EventFailure(dataState.error!));
    }
  }
}
