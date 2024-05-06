import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource dataSource;

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
      required int qty,
      required int idTourism}) async {
    await dataSource.insertTicketData(
        id: id, uuid: uuid, date: date, tourism: idTourism, qty: qty);
  }

  @override
  Future<DataState<List<TicketEntity>>> getHistoryPayment(
      {required String uuid}) async {
    try {
      final dataHistoryPayment = await dataSource.getHistoryPayment(uuid);

      return DataSuccess(dataHistoryPayment);
    } on DioException catch (e) {
      return DataFailed(e.error.toString());
    }
  }

  @override
  Future<DataState<List<TicketEntity>>> getMyTicket(
      {required String uuid}) async {
    try {
      final dataTiket = await dataSource.getMyTicket(uuid);
      return DataSuccess(dataTiket);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
