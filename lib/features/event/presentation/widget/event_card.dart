import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';

class EventCard extends StatelessWidget {
  final EventEntity entity;
  const EventCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail_event', arguments: entity);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: entity.poster_url,
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
                  child: Container(
                    height: 100,
                    width: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: const CupertinoActivityIndicator(),
                  ),
                ),
                
                imageBuilder: (context, imageProvider) => Container(
                  height: 100,
                  width: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.title,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(DateFormat('dd MMMM yyyy')
                        .format(entity.event_started)),
                    Text(entity.nama_wisata)
                  ],
                ),
              ),
              const Spacer(),
              const Icon((Icons.navigate_next))
            ],
          ),
        ),
      ),
    );
  }
}
