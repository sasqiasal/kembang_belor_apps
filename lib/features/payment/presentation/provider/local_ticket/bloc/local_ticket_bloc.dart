import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/get_saved_ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/insert_ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/remove_ticket.dart';

part 'local_ticket_event.dart';
part 'local_ticket_state.dart';

class LocalTicketBloc extends Bloc<LocalTicketEvent, LocalTicketState> {
  final GetSavedTicketsUseCase _getSavedTicketsUseCase;
  final InsertTicketUseCase _insertTicketUseCase;
  final RemoveTicketUseCase _removeTicketUseCase;
  LocalTicketBloc(this._getSavedTicketsUseCase, this._insertTicketUseCase,
      this._removeTicketUseCase)
      : super(LocalTicketInitial()) {
    on<GetSavedTicket>(onGetSavedTicket);
    on<InsertTicket>(onSaveArticle);
    on<RemoveTicket>(onRemoveTicket);
  }

  void onGetSavedTicket(
      GetSavedTicket event, Emitter<LocalTicketState> emit) async {
    emit(LocalTicketInitial());
    try {
      final ticket = await _getSavedTicketsUseCase();
      emit(LocalTicketDone(ticket));
    } catch (e) {
      emit(LocalTicketFailure());
    }
  }

  void onRemoveTicket(
      RemoveTicket remove, Emitter<LocalTicketState> emit) async {
    emit(LocalTicketInitial());
    try {
      await _removeTicketUseCase(params: remove.entity);
      final ticket = await _getSavedTicketsUseCase();
      emit(LocalTicketDone(ticket));
    } catch (e) {
      emit(LocalTicketFailure());
    }
  }

  void onSaveArticle(InsertTicket save, Emitter<LocalTicketState> emit) async {
    emit(LocalTicketInitial());
    try {
      await _insertTicketUseCase(params: save.entity);
      final ticket = await _getSavedTicketsUseCase();
      emit(LocalTicketDone(ticket));
    } catch (e) {
      emit(LocalTicketFailure());
    }
  }
}
