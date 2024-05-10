import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/event/data/data_source/remote/event_data.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDataSource dataSource;

  EventRepositoryImpl(this.dataSource);

  @override
  Future<DataState<List<EventEntity>>> getEvent() async {
    try {
      final data = await dataSource.getWisata();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<void> insertEvent(VendorCollabEntity entity) async {
    try {
      await dataSource.insertVendorCollabs(entity);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<VendorCollabEntity>>> getMyVendorCollab(
      String uuid) async {
    try {
      final data = await dataSource.getMyVendorCollab(uuid);
      return DataSuccess(data);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
