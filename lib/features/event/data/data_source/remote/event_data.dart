import 'package:kembang_belor_apps/features/event/data/model/event.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventDataSource {
  final supabase = Supabase.instance.client;

  Future<List<EventModel>> getWisata() async {
    try {
      final data = await supabase.from('event_view').select('*');
      List<EventModel> listEvent =
          data.map((e) => EventModel.fromMap(e)).toList();
      return listEvent;
    } catch (e) {
      throw e.toString();
    }
  }
}
