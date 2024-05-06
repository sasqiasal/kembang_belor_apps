import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/history/bloc/history_payment_bloc.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pembayaran'),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthStates>(builder: (context, authState) {
        if (authState is AuthUserAuthenticated) {
          return BlocBuilder<HistoryPaymentBloc, HistoryPaymentState>(
            builder: (context, state) {
              if (state.status == Status.initial) {
                context
                    .read<HistoryPaymentBloc>()
                    .add(HistoryPaymentFetch(uuid: authState.user.id));
              }
              if (state.status == Status.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == Status.loaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<HistoryPaymentBloc>()
                        .add(HistoryPaymentFetch(uuid: authState.user.id));
                  },
                  child: ListView.separated(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            child: Icon(
                              Icons.monetization_on,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Tiket dari ${state.data[index].tourism}'),
                              Text(
                                  '${DateFormat('dd MMMM yyyy').format(state.data[index].checkin_at)}'),
                            ],
                          ),
                          Text('Rp ${state.data[index].totalprice}')
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          );
        }
        return SizedBox.shrink();
      }),
    );
  }
}
