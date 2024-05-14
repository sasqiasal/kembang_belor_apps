import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/local_ticket/bloc/local_ticket_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/widgets/ticket_card.dart';
import 'package:kembang_belor_apps/injection_container.dart';

class SavedTicketPage extends StatelessWidget {
  const SavedTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocalTicketBloc(sl(), sl(), sl())..add(const GetSavedTicket()),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<LocalTicketBloc, LocalTicketState>(
            builder: (context, state) {
              if (state is LocalTicketInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is LocalTicketFailure) {
                return const Center(
                  child: Text('Ada Kesalahan'),
                );
              }

              if (state is LocalTicketDone) {
                return RefreshIndicator(
                    onRefresh: () async {},
                    child: state.entity!.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.entity!.length,
                            itemBuilder: (context, index) => Dismissible(
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      final bool res = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Konfirmasi"),
                                            content: const Text(
                                                "Apakah Anda yakin ingin menghapus data ini?"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text("Tidak"),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                              ),
                                              TextButton(
                                                child: const Text("Ya"),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return res;
                                    } else {
                                      return false;
                                    }
                                  },
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      context.read<LocalTicketBloc>().add(
                                          RemoveTicket(state.entity![index]));
                                    }
                                  },
                                  key: Key(state.entity![index].id),
                                  child: TicketItem(
                                    entity: state.entity![index],
                                    isFromTicket: false,
                                  ),
                                ))
                        : const Center(
                            child: Text('Data Tidak Ada'),
                          ));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
