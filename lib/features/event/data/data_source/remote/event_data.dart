import 'package:kembang_belor_apps/features/event/data/model/event.dart';
import 'package:kembang_belor_apps/features/event/data/model/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
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

  Future<void> insertVendorCollabs(VendorCollabEntity entity) async {
    try {
      await supabase.from('vendors').insert({
        'user_id': entity.user_id,
        'id_event': entity.id_event,
        'needed_at': entity.needed_at,
        'tanggal_daftar': DateTime.now().toIso8601String(),
        'is_accept': false
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<VendorCollabModel>> getMyVendorCollab(String uuid) async {
    try {
      final data = await supabase.from('view_vendors').select();
      List<VendorCollabModel> listCollab =
          data.map((e) => VendorCollabModel.fromMap(e)).toList();
      return listCollab;
    } catch (e) {
      throw e.toString();
    }
  }
}
