import 'dart:developer';

import 'package:kembang_belor_apps/features/home/data/models/recently_update.dart';
import 'package:kembang_belor_apps/features/home/data/models/tourism.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource {
  final supabase = Supabase.instance.client;
  Future<List<TourismModel>> getTourism() async {
    try {
      final response =
          await supabase.from('wisata').select().order('id', ascending: true);
      List<TourismModel> tourismModelList =
          response.map((e) => TourismModel.fromMap(e)).toList();
      return tourismModelList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<RecentlyFacilityModel>> getRecentlyFacilies() async {
    try {
      final response = await supabase.from('list_facility_tourism').select('''
    id,
    parent_tourism:wisata(name),
    imageUrl,
    facility_name
  ''').order('updated_at', ascending: false).limit(4);
      log(response.toString());

      List<RecentlyFacilityModel> recentlyUpdatedList =
          response.map((e) => RecentlyFacilityModel.fromMap(e)).toList();
      return recentlyUpdatedList;
    } catch (e) {
      throw e.toString();
    }
  }
}
