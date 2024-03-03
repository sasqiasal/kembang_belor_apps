import 'package:kembang_belor_apps/core/resources/data_state.dart';
import 'package:kembang_belor_apps/data/models/recently_update.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';
import 'package:kembang_belor_apps/domain/entities/tourism.dart';

abstract class TourismRepository {
  Future<DataState<List<TourismEntity>>> getTourism();

  Future<DataState<List<RecentlyFacilityEntity>>> getRecentlyFacilies();
}
