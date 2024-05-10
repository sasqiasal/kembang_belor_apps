import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/repository/event_repository.dart';

class GetHistoryVendorCollabUseCase
    implements UseCase<DataState<List<VendorCollabEntity>>, String> {
  final EventRepository _repository;

  GetHistoryVendorCollabUseCase(this._repository);
  @override
  Future<DataState<List<VendorCollabEntity>>> call({String? params}) {
    return _repository.getMyVendorCollab(params!);
  }
}
