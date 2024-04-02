import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final GetPaymentLinkDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<DataState<GetPaymentEntity>> getPaymentLink(
      {required String orderId, required int grossAmount}) async {
    try {
      final dataPayment = await dataSource.getPayment(
          orderId: orderId, grossAmount: grossAmount);

      return DataSuccess(dataPayment);
    } on DioException catch (e) {
      return DataFailed(e.error.toString());
    }
  }
}
