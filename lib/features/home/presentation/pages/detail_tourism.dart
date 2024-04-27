import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:numberpicker/numberpicker.dart';

class DetailTourims extends StatefulWidget {
  final TourismEntity entity;

  const DetailTourims({super.key, required this.entity});

  @override
  State<DetailTourims> createState() => _DetailTourimsState();
}

class _DetailTourimsState extends State<DetailTourims> {
  late int _currentValue;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    _currentValue = 1;
    date = DateTime.now().add(const Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) =>
                  StatefulBuilder(builder: (context, setState) {
                    Future<void> _selectDate(BuildContext context) async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: date,
                          lastDate: DateTime(2101));
                      if (picked != null && picked != date) {
                        setState(() {
                          date = picked;
                        });
                      }
                    }

                    return SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Jumlah Pengunjung'),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() => _currentValue != 0
                                              ? _currentValue =
                                                  _currentValue - 1
                                              : _currentValue);
                                        },
                                        icon: Icon(Icons.remove)),
                                    NumberPicker(
                                      minValue: 0,
                                      maxValue: 20,
                                      axis: Axis.vertical,
                                      value: _currentValue,
                                      onChanged: (value) =>
                                          setState(() => _currentValue = value),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() => _currentValue =
                                              _currentValue + 1);
                                        },
                                        icon: Icon(Icons.add))
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tanggal'),
                                  TextButton(
                                      onPressed: () => _selectDate(context),
                                      child: Text('Pilih Tanggal'))
                                ],
                              ),
                              Center(
                                child: Text(
                                  DateFormat.yMMMd().format(date),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  icon: Text('Pesan Sekarang'),
                                  label: Icon(Icons.check),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/payment',
                                        arguments: PaymentTourism(
                                            qty: _currentValue,
                                            date: date,
                                            entity: widget.entity));
                                  },
                                ),
                              )
                            ],
                          ),
                        ));
                  })),
          label: Row(
            children: [Text('Pesan Sekarang'), Icon(Icons.navigate_next)],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
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
                padding: EdgeInsets.only(left: 40),
                child: Text('Rp. ${widget.entity.htm} per Pengunjung'),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.entity.desc!),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
