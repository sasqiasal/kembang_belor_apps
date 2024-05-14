import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/payment/bloc/payment_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/check/bloc/check_payment_bloc.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentPage extends StatefulWidget {
  final PaymentTourism selectedTourismPayment;

  const PaymentPage({super.key, required this.selectedTourismPayment});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  MidtransSDK? _midtrans;
  final supabase = Supabase.instance.client;
  late User user;

  @override
  void initState() {
    super.initState();
    user = supabase.auth.currentUser!;
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
      if (result.transactionStatus == TransactionResultStatus.settlement) {
        context.read<CheckPaymentBloc>().add(CheckPayment(
              result,
              widget.selectedTourismPayment,
              user,
            ));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _midtrans?.removeTransactionFinishedCallback();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckPaymentBloc, CheckPaymentState>(
      listener: (context, state) {
        if (state is CheckPaymentSucces) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/receipt', ModalRoute.withName('/home'));
        }
      },
      child: Scaffold(
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
                            cacheKey: '/tourism',
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
                              const Text(
                                'Tiket Masuk',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.selectedTourismPayment.entity.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(DateFormat('EEEE')
                                  .format(widget.selectedTourismPayment.date)),
                              Text(DateFormat('dd MMMM yyyy')
                                  .format(widget.selectedTourismPayment.date))
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
                  const SizedBox(
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
                  const Spacer(),
                  SizedBox(
                    height: 75,
                    width: double.infinity,
                    child: BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<PaymentBloc>().add(GetPaymentLink(
                                  params: {
                                    'orderId': getCurrentDateTimeString(),
                                    'grossAmount':
                                        widget.selectedTourismPayment.qty *
                                            widget.selectedTourismPayment.entity
                                                .htm!
                                  },
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium),
                          child: Text(state is PaymentLoading
                              ? 'Tunggu Sebentar'
                              : 'Bayar Sekarang'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

String getCurrentDateTimeString() {
  DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('ddMMyyyyHHmmss').format(now);
  return formattedDateTime;
}
