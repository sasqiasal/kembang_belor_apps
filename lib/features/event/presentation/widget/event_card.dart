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
      onTap: () {},
      child: Card(
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: entity.poster_url,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadiusDirectional.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                        )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      entity.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(DateFormat('dd MMMM yyyy')
                        .format(entity.event_started)),
                    Text(entity.event_needed.isNotEmpty
                        ? 'Membutuhkan Vendor'
                        : '')
                  ],
                ),
                Icon((Icons.navigate_next))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
