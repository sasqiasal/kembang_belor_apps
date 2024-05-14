import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: entity.poster_url!,
                cacheKey: '/poster',
                errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                  padding: const EdgeInsetsDirectional.only(end: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ),
                ),
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Vendor: ${entity.needed_at}'),
                  Text(
                      'Status : ${entity.is_accept! ? 'Tersetujui' : 'Tidak/Belum Disetujui'}')
                ],
              ),
              const Icon(Icons.navigate_next)
            ],
          ),
        ),
      ),
    );
  }
}
