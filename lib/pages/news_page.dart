import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/data/models/acara.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Berita Kembang Belor'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
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
                            const SizedBox(height: 5),
                            Text(DateFormat('dd MMMM yyyy').format(
                                DateFormat("yyyy-MM-dd")
                                    .parse(acara['tanggalMulai'].toString()))),
                            const Text('s/d'),
                            Text(DateFormat('dd MMMM yyyy').format(
                                DateFormat("yyyy-MM-dd").parse(
                                    acara['tanggalSelesai'].toString()))),
                            const SizedBox(height: 5),
                            Text(
                              acara['tempat'].toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Berita',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Card(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/splash.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Berita Tentang Kembang Belor')
                            ]),
                          ))))
            ])),
      ),
    );
  }
}
