import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/usecase/get_history_collab.dart';

part 'collab_history_event.dart';
part 'collab_history_state.dart';

class CollabHistoryBloc extends Bloc<CollabHistoryEvent, CollabHistoryState> {
  final GetHistoryVendorCollabUseCase _useCase;
  CollabHistoryBloc(this._useCase) : super(CollabHistoryState.initial()) {
    on<FetchCollabHistory>(_collabHistoryEvent);
  }

  void _collabHistoryEvent(
      FetchCollabHistory event, Emitter<CollabHistoryState> emit) async {
    emit(state.copyWith(status: Status.loading, data: []));
    final data = await _useCase(params: event.uuid);

    if (data is DataSuccess && data.data != null) {
      emit(state.copyWith(status: Status.loaded, data: data.data));
    }

    if (data is DataFailed) {
      emit(state.copyWith(status: Status.failure, data: []));
    }
  }
}
