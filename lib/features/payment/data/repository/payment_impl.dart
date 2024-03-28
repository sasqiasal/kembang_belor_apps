import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class PaymentImpl extends PaymentRepository {
  final dataSource = GetPaymentLink();

  @override
  Future<DataState<GetPaymentEntity>> getPaymentLink(
      {required String orderId, required int grossAmount}) {
    // TODO: implement getPaymentLink
    throw UnimplementedError();
  }
}
