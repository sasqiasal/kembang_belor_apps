import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/event/data/model/event.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/home/data/models/tourism.dart';

abstract class EventRepository {
  Future<DataState<List<EventEntity>>> getEvent();
}
