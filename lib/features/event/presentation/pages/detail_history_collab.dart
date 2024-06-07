import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';

class DetailHistoryVendorCollabPage extends StatelessWidget {
  final VendorCollabEntity entity;
  const DetailHistoryVendorCollabPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     alignment: Alignment.bottomCenter,
    //     children: [
    //       CachedNetworkImage(
    //         imageUrl: entity.poster_url!,
    //         cacheKey: '/poster',
    //         imageBuilder: (context, imageProvider) => Container(
    //           height: double.infinity,
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //               image:
    //                   DecorationImage(image: imageProvider, fit: BoxFit.cover)),
    //         ),
    //       ),
    //       TweenAnimationBuilder(
    //         duration: Durations.short4,
    //         tween: Tween<double>(begin: 0, end: 100),
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisSize: MainAxisSize.max,
    //             children: [
    //               Text(
    //                 'Kolam Renang',
    //                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    //               ),
    //               Text(
    //                 'Kolam Renang Nyaman PPOLLLLL',
    //                 maxLines: 2,
    //                 style: TextStyle(
    //                   overflow: TextOverflow.clip,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         builder: (context, value, child) {
    //           return AnimatedContainer(
    //               duration: Durations.long1,
    //               height: value,
    //               decoration: const BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(20),
    //                       topRight: Radius.circular(20))),
    //               child: child);
    //         },
    //       )
    //     ],
    //   ),
    // );

    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: entity.poster_url!,
            cacheKey: '/poster',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title!,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Vendor sebagai:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    entity.needed_at,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    DateFormat('dd MMMM yyyy').format(entity.tanggal_daftar!),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Status:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    entity.is_accept! ? 'Tersetujui' : 'Tidak/Belum Disetujui',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
