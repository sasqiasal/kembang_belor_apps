import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/history_payment.dart';

part 'history_payment_event.dart';
part 'history_payment_state.dart';

class HistoryPaymentBloc
    extends Bloc<HistoryPaymentEvent, HistoryPaymentState> {
  final GetHistoryPaymentUseCase _historyPaymentUseCase;
  HistoryPaymentBloc(this._historyPaymentUseCase)
      : super(HistoryPaymentState.initial()) {
    on<HistoryPaymentFetch>(_getHistoryData);
  }

  void _getHistoryData(
      HistoryPaymentFetch event, Emitter<HistoryPaymentState> emit) async {
    emit(state.copyWith(status: Status.loading, data: []));

    final data = await _historyPaymentUseCase(params: event.uuid);

    if (data is DataSuccess && data.data != null) {
      emit(state.copyWith(status: Status.loaded, data: data.data));
    }

    if (data is DataFailed) {
      emit(state.copyWith(status: Status.failure, data: []));
    }
  }
}
