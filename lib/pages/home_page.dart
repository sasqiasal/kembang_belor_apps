import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/models/edited_pariwisata.dart';
import 'package:kembang_belor_apps/models/pariwisata.dart';
import 'package:kembang_belor_apps/pages/facility_page.dart';

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
                itemBuilder: (context, index) => Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FacilitiesPage(),
                          ));
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                fit: BoxFit.fill,
                                width: size.width / 5.84,
                                height: size.height / 10.74,
                                image: AssetImage(
                                  listPariwisata[index]['imageUrl'].toString(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${listPariwisata[index]['nama']}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    listPariwisata[index]['deskripsi']
                                                .toString()
                                                .length >
                                            15
                                        ? '${listPariwisata[index]['deskripsi'].toString().substring(0, 15)}...'
                                        : listPariwisata[index]['deskripsi']
                                            .toString(),
                                  )),
                                  Text(
                                      'HTM Rp. ${listPariwisata[index]['htm']}')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))),
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
            itemBuilder: (context, index) => Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                                '${modifiedPariwisata[index]['imageUrl']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${modifiedPariwisata[index]['facility_name']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('${modifiedPariwisata[index]['parent_turism']}')
                        ],
                      ),
                    )
                  ]),
            ),
          ))
        ]),
      ),
    ));
  }
}
