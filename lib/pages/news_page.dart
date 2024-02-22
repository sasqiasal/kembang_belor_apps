import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/models/acara.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Berita Kembang Belor'),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Acara',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 175,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: Acara.length,
                  itemBuilder: (context, index) {
                    final acara = Acara[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              acara['judul'].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(DateFormat('dd MMMM yyyy').format(
                                DateFormat("yyyy-MM-dd")
                                    .parse(acara['tanggalMulai'].toString()))),
                            Text('s/d'),
                            Text(DateFormat('dd MMMM yyyy').format(
                                DateFormat("yyyy-MM-dd").parse(
                                    acara['tanggalSelesai'].toString()))),
                            SizedBox(height: 5),
                            Text(
                              acara['tempat'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Berita',
                style: TextStyle(fontSize: 18),
              )
            ])),
      ),
    );
  }
}
