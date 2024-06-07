import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';

class DetailEventPage extends StatelessWidget {
  final EventEntity entity;
  const DetailEventPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final sheet = GlobalKey();
    final controller = DraggableScrollableController();
    return Scaffold(
        appBar: AppBar(
          title: Text(entity.title),
        ),
        body: Stack(children: [
          CachedNetworkImage(
            imageUrl: entity.poster_url,
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
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
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  )),
            ),
          ),
          DraggableScrollableSheet(
            key: sheet,
            initialChildSize: 0.15,
            maxChildSize: 0.6,
            minChildSize: 0.15,
            expand: true,
            snap: true,
            snapSizes: const [0.5],
            controller: controller,
            builder: (BuildContext context, ScrollController scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          entity.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SliverList.list(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.date_range),
                              Text(DateFormat('dd MMMM yyyy')
                                  .format(entity.event_started)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.home),
                              Text(entity.nama_wisata)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(entity.description)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]));
  }
}
