import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:supabase/supabase.dart';

abstract class PaymentRepository {
  Future<DataState<GetPaymentEntity>> getPaymentLink(
      {required String orderId, required int grossAmount});

  Future<String> getUID();

  Future<void> insertData(
      {required String id,
      required User uuid,
      required DateTime date,
      required int idTourism,
      required int qty});

  Future<DataState<List<TicketEntity>>> getHistoryPayment(
      {required String uuid});

  Future<DataState<List<TicketEntity>>> getMyTicket({required String uuid});

  Future<List<TicketEntity>> getSavedTickets();

  Future<void> saveTicket(TicketEntity ticket);

  Future<void> removeTicket(TicketEntity ticket);
}
