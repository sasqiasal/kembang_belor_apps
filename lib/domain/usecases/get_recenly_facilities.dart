import 'package:kembang_belor_apps/core/resources/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';

import 'package:kembang_belor_apps/domain/repository/tourism_repository.dart';

class GetRecentlyFaciliesUseCase
    implements UseCase<DataState<List<RecentlyFacilityEntity>>, void> {
  final TourismRepository _repository;

  GetRecentlyFaciliesUseCase(this._repository);
  @override
  Future<DataState<List<RecentlyFacilityEntity>>> call({void params}) {
    return _repository.getRecentlyFacilies();
  }
}
