import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/check/bloc/check_payment_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    late final User _user;
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthStates>(
        builder: (context, authState) {
          if (authState is AuthUserAuthenticated) {
            _user = authState.user;
            return BlocBuilder<CheckPaymentBloc, CheckPaymentState>(
              builder: (context, state) {
                if (state is CheckPaymentSucces) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('Bukti Pembayaran'),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.check,
                              size: 80, color: Theme.of(context).primaryColor),
                          Text(
                            'Pembayaran Berhasil',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Rp. ${state.data.qty * state.data.entity.htm!.toInt()}',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor),
                          ),
                          Card(
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 60,
                                    child: Card(
                                      color: Colors.blueGrey[50],
                                      child:
                                          Center(child: Text('Detail Pesanan')),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Id Order'),
                                            Text('${state.id}')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Tanggal Order'),
                                            Text(
                                                '${DateFormat('dd-MM-yyyy').format(state.data.date)}'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Metode Pembayaran'),
                                            Text('${state.result.paymentType}'),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Total'),
                                            Text(
                                                'Rp. ${state.data.qty * state.data.entity.htm!.toInt()}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/home');
                              },
                              child: const Text('Tutup'))
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
