import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/models/pariwisata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(
              'Explore \nKembang Belor',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Pariwisata',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listPariwisata.length,
                itemBuilder: (context, index) => Card(
                    elevation: 4,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              fit: BoxFit.fill,
                              width: 70,
                              height: 70,
                              image: AssetImage(
                                listPariwisata[index]['imageUrl'].toString(),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${listPariwisata[index]['nama']}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                  child: Text(
                                '${listPariwisata[index]['deskripsi']}',
                              )),
                              Text('${listPariwisata[index]['htm']}')
                            ],
                          )
                        ],
                      ),
                    ))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Recently Updated',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Card(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      children: [Text('${listPariwisata[index]['nama']}')])),
            ),
          ))
        ]),
      ),
    ));
  }
}
