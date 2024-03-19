import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';

class DetailTourims extends StatelessWidget {
  final TourismEntity entity;
  const DetailTourims({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(entity.name!),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            cacheKey: '/tourism',
            imageUrl: entity.imageUrl!,
          )
        ],
      ),
    );
  }
}
