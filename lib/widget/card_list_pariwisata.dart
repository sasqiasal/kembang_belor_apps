import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/pages/facility_page.dart';

class PariwisataCard extends StatelessWidget {
  final String deskripsi;
  final String nama;
  final String imageUrl;
  final String htm;
  const PariwisataCard(
      {super.key,
      required this.imageUrl,
      required this.nama,
      required this.deskripsi,
      required this.htm});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FacilitiesPage(),
              ));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image(
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                    image: AssetImage(imageUrl),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                          child: Text(
                        deskripsi.length > 15
                            ? '${deskripsi.substring(0, 15)}...'
                            : deskripsi,
                      )),
                      Text('HTM Rp. $htm')
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
