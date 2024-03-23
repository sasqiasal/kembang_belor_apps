import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';

class PaymentPage extends StatelessWidget {
  final PaymentTourism selectedTourismPayment;

  const PaymentPage({super.key, required this.selectedTourismPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Anda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: selectedTourismPayment.entity.imageUrl!,
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
                          selectedTourismPayment.entity.name!,
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
              'Detail Pemesanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${selectedTourismPayment.qty.toString()} Tiket'),
                Text(selectedTourismPayment.entity.htm!.toString()),
                Text(
                    '${selectedTourismPayment.qty * selectedTourismPayment.entity.htm!}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
