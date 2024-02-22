import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/models/edited_pariwisata.dart';
import 'package:kembang_belor_apps/models/pariwisata.dart';
import 'package:kembang_belor_apps/pages/facility_page.dart';
import 'package:kembang_belor_apps/widget/card_list_pariwisata.dart';
import 'package:kembang_belor_apps/widget/card_recently_updated.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Explore \nKembang Belor',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Pariwisata',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: size.height / 5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listPariwisata.length,
                itemBuilder: (context, index) {
                  var pariwisata = listPariwisata[index];
                  return PariwisataCard(
                    imageUrl: pariwisata['imageUrl'].toString(),
                    nama: pariwisata['nama'].toString(),
                    deskripsi: pariwisata['deskripsi'].toString(),
                    htm: pariwisata['htm'].toString(),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recently Updated',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: modifiedPariwisata.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              var pariwisata = modifiedPariwisata[index];
              return RecentlyUpdatedCard(
                imageUrl: pariwisata['imageUrl'].toString(),
                facilityName: pariwisata['facility_name'].toString(),
                parentTourism: pariwisata['parent_turism'].toString(),
              );
            },
          ))
        ]),
      ),
    ));
  }
}
