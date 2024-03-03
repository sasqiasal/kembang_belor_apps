import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state.dart';

import 'package:kembang_belor_apps/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/domain/usecases/get_tourism.dart';
import 'package:meta/meta.dart';

part 'tourism_event.dart';
part 'tourism_state.dart';

class TourismBloc extends Bloc<TourismEvent, TourismState> {
  final GetTourismUseCase _tourismRepository;
  TourismBloc(this._tourismRepository) : super(TourismLoading()) {
    on<TourismFected>(_getTourismFected);
  }
  void _getTourismFected(
      TourismFected event, Emitter<TourismState> emit) async {
    final dataState = await _tourismRepository();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(TourismSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TourismFailure(dataState.error!));
    }
  }
}
