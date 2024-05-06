import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';

class VendorCard extends StatelessWidget {
  final EventEntity entity;
  const VendorCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail_vendor', arguments: entity);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: entity.poster_url,
                imageBuilder: (context, imageProvider) => Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadiusDirectional.circular(10),
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
                    Text(entity.event_needed.isNotEmpty
                        ? entity.event_needed.length > 2
                            ? 'Kebutuhan Event : \n${entity.event_needed.sublist(1, 3).join('\n')}'
                            : 'Kebutuhan Event : \n${entity.event_needed.join('\n')}'
                        : ''),
                    Text.rich(TextSpan(
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        children: [TextSpan(text: 'Lihat Selengkapnya')]))
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
