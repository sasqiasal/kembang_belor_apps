import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';
import 'package:kembang_belor_apps/features/event/domain/repository/event_repository.dart';

class InsertVendorCollabsUseCase implements UseCase<void, VendorCollabEntity> {
  final EventRepository _repository;

  InsertVendorCollabsUseCase(this._repository);

  @override
  Future<void> call({VendorCollabEntity? params}) {
    return _repository.insertEvent(params!);
  }
}
