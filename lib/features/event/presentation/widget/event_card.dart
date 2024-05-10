import 'package:cached_network_image/cached_network_image.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl: entity.poster_url,
                cacheKey: '/poster',
                imageBuilder: (context, imageProvider) => Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadiusDirectional.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(DateFormat('dd MMMM yyyy')
                        .format(entity.event_started)),
                    Text(entity.nama_wisata)
                  ],
                ),
              ),
              Icon((Icons.navigate_next))
            ],
          ),
        ),
      ),
    );
  }
}
