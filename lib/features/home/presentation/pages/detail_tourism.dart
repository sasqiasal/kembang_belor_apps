import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:numberpicker/numberpicker.dart';

class DetailTourims extends StatefulWidget {
  final TourismEntity entity;

  const DetailTourims({super.key, required this.entity});

  @override
  State<DetailTourims> createState() => _DetailTourimsState();
}

class _DetailTourimsState extends State<DetailTourims> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => StatefulBuilder(
                    builder: (context, setState) => SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Jumlah Pengunjung'),
                              NumberPicker(
                                minValue: 0,
                                maxValue: 20,
                                axis: Axis.horizontal,
                                value: _currentValue,
                                onChanged: (value) =>
                                    setState(() => _currentValue = value),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  icon: Text('Pesan Sekarang'),
                                  label: Icon(Icons.check),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
          label: Row(
            children: [Text('Pesan Sekarang'), Icon(Icons.navigate_next)],
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              CachedNetworkImage(
                cacheKey: '/tourism',
                imageBuilder: (context, imageProvider) => Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                imageUrl: widget.entity.imageUrl!,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.entity.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => StatefulBuilder(
                              builder: (context, setState) => SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15,
                                        top: 20,
                                        left: 20,
                                        right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text('Jumlah Pengunjung'),
                                        NumberPicker(
                                          minValue: 0,
                                          maxValue: 20,
                                          axis: Axis.horizontal,
                                          value: _currentValue,
                                          onChanged: (value) => setState(
                                              () => _currentValue = value),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: ElevatedButton.icon(
                                            icon: Text('Pesan Sekarang'),
                                            label: Icon(Icons.check),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ));
                  },
                  label: Icon(
                    Icons.navigate_next,
                    size: 40,
                  ),
                  icon: Text(
                    'Pesan Sekarang',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
