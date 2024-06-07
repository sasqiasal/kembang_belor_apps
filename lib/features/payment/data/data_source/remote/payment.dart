import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/payment/data/models/ticket.dart';
import 'package:kembang_belor_apps/features/payment/data/models/payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentRemoteDataSource {
  final dio = Dio();

  Future<GetPaymentModel> getPayment(
      {required String orderId, required int grossAmount}) async {
    String serverKey = 'SB-Mid-server-hIhpmxYRUKEKSZqtquUvcTvm';
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers['authorization'] =
        'Basic ${base64.encode(serverKey.codeUnits)}';
    final jsonData = await dio.post(
      'https://app.sandbox.midtrans.com/snap/v1/transactions',
      queryParameters: {
        'transaction_details': {
          'order_id': orderId,
          'gross_amount': grossAmount
        }
      },
    );

    return GetPaymentModel.fromMap(jsonData.data);
  }

  final supabase = Supabase.instance.client;

  Future<String> getUID() async {
    final date = DateTime.now();
    final dateNow = DateFormat('yyyy-MM-dd').format(date);
    final dateTimeInserted = DateFormat('ddMMyyyy').format(date);
    try {
      final data = await supabase
          .from('tickets')
          .select('id')
          .eq('added_at::date', dateNow)
          .order('id');

      if (data.isEmpty) {
        return 'TSC${dateTimeInserted}00001';
      }
      final lastId = data.first['id'];
      final lastNumber = int.parse(lastId.split('TSC$dateTimeInserted')[1]);
      final newNumber = lastNumber + 1;
      final paddedNumber = newNumber.toString().padLeft(5, '0');

      return 'TSC$dateTimeInserted$paddedNumber';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> insertTicketData(
      {required String id,
      required User uuid,
      required DateTime date,
      required int tourism,
      required int qty}) async {
    await supabase.from('tickets').insert({
      'id': id,
      'user_id': uuid.id,
      'checkin_at': date.toIso8601String(),
      'added_at': DateTime.now().toIso8601String(),
      'tourism_id': tourism,
      'qty': qty
    });
  }

  Future<List<TicketModel>> getHistoryPayment(String uuid) async {
    try {
      final data = await supabase
          .from('view_ticket')
          .select('*')
          .eq('user_id', uuid)
          .order('added_at', ascending: false);
      List<TicketModel> listEvent =
          data.map((e) => TicketModel.fromMap(e)).toList();
      return listEvent;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<TicketModel>> getMyTicket(String uuid) async {
    try {
      final data = await supabase
          .from('view_ticket')
          .select()
          .gte('checkin_at', DateTime.now())
          .eq('is_checkin', false)
          .eq('user_id', uuid)
          .order('checkin_at', ascending: true);

      List<TicketModel> listEvent =
          data.map((e) => TicketModel.fromMap(e)).toList();
      return listEvent;
    } catch (e) {
      throw e.toString();
    }
  }
}
