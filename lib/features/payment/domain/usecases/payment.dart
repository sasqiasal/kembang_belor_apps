import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class GetPaymentLink implements UseCase<DataState<GetPaymentEntity>, void> {
  final PaymentRepository _repository;

  GetPaymentLink(this._repository);
  @override
  Future<DataState<GetPaymentEntity>> call({void params}) {
    return _repository.getPaymentLink();
  }
}
