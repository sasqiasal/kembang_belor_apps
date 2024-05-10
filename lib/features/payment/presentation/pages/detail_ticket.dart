import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/local_ticket/bloc/local_ticket_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTicketPage extends StatelessWidget {
  final TicketEntity entity;
  final bool isFromTicket;
  const DetailTicketPage(
      {super.key, required this.entity, required this.isFromTicket});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 18);
    return Scaffold(
      body: BlocListener<LocalTicketBloc, LocalTicketState>(
        listener: (context, state) {
          if (state is LocalTicketDone) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Berhasil')));
          }
          if (state is LocalTicketFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Gagal')));
          }
        },
        child: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/bernahdevalei.jpg',
                  fit: BoxFit.cover,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 15, right: 15),
              child: Column(
                children: [
                  Card(
                      child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          QrImageView(
                            data: entity.id,
                            size: 200,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Berlaku pada tanggal : ${_formatDate(entity.checkin_at)}',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('Nama Wisata'),
                              Text(
                                entity.tourism,
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Tanggal Pemesanan'),
                              Text(
                                _formatDate(entity.added_at),
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Harga Tiket'),
                              Text(
                                'Rp. ${entity.totalprice.toString()}',
                                style: style,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  isFromTicket
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(
                                40), // fromHeight use double.infinity as width and 40 is the height
                          ),
                          onPressed: () {
                            context
                                .read<LocalTicketBloc>()
                                .add(InsertTicket(entity));
                          },
                          child: Text('Simpan Ticket'),
                        )
                      : SizedBox.shrink()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }
}
