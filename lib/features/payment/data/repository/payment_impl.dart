import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  @override
  Future<String> getUID() async {
    try {
      final data = await dataSource.getUID();
      return data;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<void> insertData(
      {required String id,
      required User uuid,
      required DateTime date,
      required int idTourism}) async {
    await dataSource.insertTicketData(
        id: id, uuid: uuid, date: date, tourism: idTourism);
  }
}
