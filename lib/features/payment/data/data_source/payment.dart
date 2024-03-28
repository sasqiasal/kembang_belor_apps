import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kembang_belor_apps/features/payment/data/models/payment.dart';

class GetPaymentLink {
  final dio = Dio();

  Future<GetPaymentModel> getPayment(
      {required String orderId, required int grossAmount}) async {
    String serverKey = 'SB-Mid-server-hIhpmxYRUKEKSZqtquUvcTvm';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Basic ${base64.encode(serverKey.codeUnits)}';
    final response = await dio.post(
      ' https://app.sandbox.midtrans.com/snap/v1/transactions',
      queryParameters: {
        'transaction_detail': {'order_id': orderId, 'gross_amount': grossAmount}
      },
    );

    final GetPaymentModel model = GetPaymentModel.fromJson(response.data);
    return model;
  }
}
