import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/payment/data/models/payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetPaymentLinkDataSource {
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
    final dateNow = DateFormat('ddMMyyyy').format(DateTime.now());
    try {
      final data = await supabase
          .from('ticket')
          .select('id')
          .eq('added_at', DateTime.now())
          .order('id', ascending: false)
          .limit(1);

      if (data.isEmpty) {
        return 'TSC${dateNow}00001';
      }
      final lastId = data.first['id'];
      final lastNumber = int.parse(lastId.split('TSC$dateNow')[1]);
      final newNumber = lastNumber + 1;
      final paddedNumber = newNumber.toString().padLeft(5, '0');

      return 'TSC$dateNow$paddedNumber';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> insertTicketData(
      {required String id,
      required User uuid,
      required DateTime date,
      required int tourism}) async {
    await supabase.from('ticket').insert({
      'id': id,
      'user_id': uuid.id,
      'added_at': date,
      'tourism_id': tourism
    });
  }
}
