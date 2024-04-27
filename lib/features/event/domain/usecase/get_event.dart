import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/domain/repository/event_repository.dart';

class GetEventUseCase implements UseCase<DataState<List<EventEntity>>, void> {
  final EventRepository _repository;

  GetEventUseCase(this._repository);

  @override
  Future<DataState<List<EventEntity>>> call({void params}) async {
    return _repository.getEvent();
  }
}
