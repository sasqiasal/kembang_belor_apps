import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/features/home/domain/repository/tourism_repository.dart';

class GetTourismUseCase
    implements UseCase<DataState<List<TourismEntity>>, void> {
  final TourismRepository _repository;

  GetTourismUseCase(this._repository);

  @override
  Future<DataState<List<TourismEntity>>> call({void params}) {
    return _repository.getTourism();
  }
}
