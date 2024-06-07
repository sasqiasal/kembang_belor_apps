import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/recently_update.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class DetailFacility extends StatelessWidget {
  final RecentlyFacilityEntity entity;
  const DetailFacility({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        PanoramaViewer(
          // child: Image.network(
          //   entity.immersive_picture!,
          //   loadingBuilder: (BuildContext context, Widget child,
          //       ImageChunkEvent? loadingProgress) {
          //     if (loadingProgress == null) return child;
          //     return Center(
          //       child: CircularProgressIndicator(
          //         value: loadingProgress.expectedTotalBytes != null
          //             ? loadingProgress.cumulativeBytesLoaded /
          //                 loadingProgress.expectedTotalBytes!
          //             : null,
          //       ),
          //     );
          //   },
          // ),
          child: Image(
            image: CachedNetworkImageProvider(
              entity.immersive_picture!,
            ),
          ),
        ),
        TweenAnimationBuilder(
          duration: Durations.short4,
          tween: Tween<double>(begin: 0, end: 155),
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.facilityName!,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      entity.parentTourism!,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.location_on))
              ],
            ),
          ),
          builder: (context, value, child) {
            return AnimatedContainer(
                duration: Durations.long1,
                height: value,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: child);
          },
        )
      ]),
    );
  }
}
