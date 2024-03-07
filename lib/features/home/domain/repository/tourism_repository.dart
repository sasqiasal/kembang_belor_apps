import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';

import 'package:kembang_belor_apps/features/home/domain/entities/recently_update.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';

abstract class TourismRepository {
  Future<DataState<List<TourismEntity>>> getTourism();

  Future<DataState<List<RecentlyFacilityEntity>>> getRecentlyFacilies();
}
