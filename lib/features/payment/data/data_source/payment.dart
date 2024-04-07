import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/features/payment/data/models/payment.dart';

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
}
