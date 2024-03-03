import 'package:kembang_belor_apps/data/models/tourism.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource {
  Future<List<TourismModel>> getTourism() async {
    try {
      final response = await Supabase.instance.client
          .from('wisata')
          .select()
          .order('id', ascending: true);
      List<TourismModel> tourismModelList =
          response.map((e) => TourismModel.fromMap(e)).toList();
      return tourismModelList;
    } catch (e) {
      throw e.toString();
    }
  }
}
