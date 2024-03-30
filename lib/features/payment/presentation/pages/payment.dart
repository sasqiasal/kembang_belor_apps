import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/tourism/bloc/tourism_bloc.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/payment/bloc/payment_bloc.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

class PaymentPage extends StatefulWidget {
  final PaymentTourism selectedTourismPayment;

  const PaymentPage({super.key, required this.selectedTourismPayment});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  MidtransSDK? _midtrans;
  @override
  void initState() {
    super.initState();
    initSDK();
  }

  void initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dotenv.env['CLIENTKEY'] ?? "",
        merchantBaseUrl: dotenv.env['BASEURL'] ?? "",
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans!.setTransactionFinishedCallback((result) {
      print('Hasil Pembayaran : ${result.toJson().toString()}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _midtrans?.removeTransactionFinishedCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Anda'),
      ),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) async {
          if (state is PaymentLoading) {}

          if (state is PaymentError) {
            log(state.error!);
          }

          if (state is PaymentSucess) {
            log(state.model!.toString());
            _midtrans!.startPaymentUiFlow(token: state.model!.token);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              widget.selectedTourismPayment.entity.imageUrl!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tiket Masuk',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.selectedTourismPayment.entity.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Hari'),
                            Text('Tanggal')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Detail Pesanan',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${widget.selectedTourismPayment.qty.toString()} Tiket',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                        'Rp. ${widget.selectedTourismPayment.qty * widget.selectedTourismPayment.entity.htm!}',
                        style: Theme.of(context).textTheme.headlineSmall)
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().add(GetPaymentLink(
                            params: {
                              'orderId': getCurrentDateTimeString(),
                              'grossAmount': widget.selectedTourismPayment.qty *
                                  widget.selectedTourismPayment.entity.htm!
                            },
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.headlineMedium),
                    child: const Text('Bayar Sekarang'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

String getCurrentDateTimeString() {
  DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('ddMMyyyyHHmmss').format(now);
  return formattedDateTime;
}
