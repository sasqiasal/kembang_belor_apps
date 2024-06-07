import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/local/app_database.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/remote/payment.dart';
import 'package:kembang_belor_apps/features/payment/data/models/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource dataSource;

  final AppDatabase _appDatabase;
  PaymentRepositoryImpl(this.dataSource, this._appDatabase);

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

  @override
  Future<List<TicketEntity>> getSavedTickets() {
    return _appDatabase.ticketDao.findAllTicket();
  }

  @override
  Future<void> removeTicket(TicketEntity ticket) {
    return _appDatabase.ticketDao.deleteTicket(TicketModel.fromEntity(ticket));
  }

  @override
  Future<void> saveTicket(TicketEntity ticket) {
    return _appDatabase.ticketDao.insertTicket(TicketModel.fromEntity(ticket));
  }
}
