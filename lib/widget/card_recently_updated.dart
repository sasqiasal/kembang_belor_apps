import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';

class RecentlyUpdatedCard extends StatelessWidget {
  final RecentlyFacilityEntity model;
  const RecentlyUpdatedCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          // child: Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     image: DecorationImage(
          //       image: AssetImage(imageUrl),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          child: CachedNetworkImage(
            imageUrl: model.imageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              decoration:
                  BoxDecoration(image: DecorationImage(image: imageProvider)),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.facility_name!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(model.parent_tourism!['name'])
            ],
          ),
        )
      ]),
    );
  }
}
