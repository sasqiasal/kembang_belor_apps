import 'dart:developer';

import 'package:kembang_belor_apps/features/home/data/models/recently_update.dart';
import 'package:kembang_belor_apps/features/home/data/models/tourism.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource {
  final supabase = Supabase.instance.client;
  Future<List<TourismModel>> getTourism() async {
    try {
      final response =
          await supabase.from('wisatas').select().order('id', ascending: true);
      List<TourismModel> tourismModelList =
          response.map((e) => TourismModel.fromMap(e)).toList();
      return tourismModelList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<RecentlyFacilityModel>> getRecentlyFacilies() async {
    try {
      final response = await supabase
          .from('facility_tourism_view')
          .select()
          .order('updated_at', ascending: false);

      log(response.toString());

      List<RecentlyFacilityModel> recentlyUpdatedList =
          response.map((e) => RecentlyFacilityModel.fromMap(e)).toList();
      return recentlyUpdatedList;
    } catch (e) {
      throw e.toString();
    }
  }
}
