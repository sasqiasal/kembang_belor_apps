import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/core/resources/data_state.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';
import 'package:kembang_belor_apps/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/domain/usecases/get_recenly_facilities.dart';

part 'recently_tourism_event.dart';
part 'recently_tourism_state.dart';

class RecentlyTourismBloc
    extends Bloc<RecentlyTourismEvent, RecentlyTourismState> {
  final GetRecentlyFaciliesUseCase _getRecentlyFaciliesUseCase;
  RecentlyTourismBloc(this._getRecentlyFaciliesUseCase)
      : super(RecentlyTourismLoading()) {
    on<RecentlyFacilityFected>(_getRecentlyFacility);
  }

  void _getRecentlyFacility(
      RecentlyFacilityFected event, Emitter<RecentlyTourismState> emit) async {
    final dataState = await _getRecentlyFaciliesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RecentlyTourismSuccess(entities: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RecentlyTourismFailure(dataState.error!));
    }
  }
}
