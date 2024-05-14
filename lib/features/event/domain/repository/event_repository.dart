import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';

abstract class EventRepository {
  Future<DataState<List<EventEntity>>> getEvent();

  Future<void> insertEvent(VendorCollabEntity entity);

  Future<DataState<List<VendorCollabEntity>>> getMyVendorCollab(String uuid);
}
