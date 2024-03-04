import 'package:kembang_belor_apps/core/resources/data_state.dart';
import 'package:kembang_belor_apps/data/data_source/remote.dart';
import 'package:kembang_belor_apps/data/models/recently_update.dart';
import 'package:kembang_belor_apps/data/models/tourism.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';
import 'package:kembang_belor_apps/domain/repository/tourism_repository.dart';

class TourismRepositoryImpl implements TourismRepository {
  final RemoteDataSource dataSource;

  TourismRepositoryImpl(this.dataSource);

  @override
  Future<DataState<List<TourismModel>>> getTourism() async {
    try {
      final dataTourism = await dataSource.getTourism();

      return DataSuccess(dataTourism);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<RecentlyFacilityModel>>> getRecentlyFacilies () async {
    try {
      final dataRecenlyFacilities = await dataSource.getRecentlyFacilies();
      return DataSuccess(dataRecenlyFacilities);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
