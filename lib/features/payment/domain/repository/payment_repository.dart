import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';

abstract class PaymentRepository {
  Future<DataState<GetPaymentEntity>> getPaymentLink(
      {required String orderId, required int grossAmount});
}
