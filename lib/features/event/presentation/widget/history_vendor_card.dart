import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';

class HistoryVendorCard extends StatelessWidget {
  final VendorCollabEntity entity;
  const HistoryVendorCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/detail_history_collab', arguments: entity);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: entity.poster_url!,
                cacheKey: '/poster',
                imageBuilder: (context, imageProvider) => Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    entity.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Vendor: ${entity.needed_at}'),
                  Text(
                      'Status : ${entity.is_accept! ? 'Tersetujui' : 'Tidak/Belum Disetujui'}')
                ],
              ),
              Icon(Icons.navigate_next)
            ],
          ),
        ),
      ),
    );
  }
}
