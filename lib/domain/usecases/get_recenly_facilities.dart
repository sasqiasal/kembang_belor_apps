import 'package:kembang_belor_apps/core/resources/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/domain/entities/tourism.dart';

class GetRecentlyFaciliesUseCase
    implements UseCase<DataState<List<TourismEntity>>, void> {
  @override
  Future<DataState<List<TourismEntity>>> call({void params}) {
    throw UnimplementedError();
  }
}
