import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class GetPaymentLinkUseCase
    implements UseCase<DataState<GetPaymentEntity>, Map<String, Object>> {
  final PaymentRepository _repository;

  GetPaymentLinkUseCase(this._repository);

  @override
  Future<DataState<GetPaymentEntity>> call({Map<String, Object>? params}) {
    return _repository.getPaymentLink(
        orderId: params!['orderId'].toString(),
        grossAmount: int.parse(params['grossAmount'].toString()));
  }
}
