import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/my_ticket.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final GetMyTicketUseCase getMyTicketUseCase;
  TicketBloc(this.getMyTicketUseCase) : super(TicketState.initial()) {
    on<MyTicketFetch>(_myTicketFetch);
  }

  void _myTicketFetch(MyTicketFetch event, Emitter<TicketState> emit) async {
    emit(state.copyWith(status: Status.loading, data: []));

    final data = await getMyTicketUseCase(params: event.uuid);

    if (data is DataSuccess && data.data != null) {
      emit(state.copyWith(status: Status.loaded, data: data.data));
    }

    if (data is DataFailed) {
      emit(state.copyWith(status: Status.failure, data: []));
    }
  }
}
