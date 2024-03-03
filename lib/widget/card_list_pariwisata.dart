import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/pages/facility_page.dart';

class PariwisataCard extends StatelessWidget {
  final TourismEntity model;

  const PariwisataCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FacilitiesPage(),
              ));
            },
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: model.imageUrl!,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                          child: Text(
                        model.desc!.length > 15
                            ? '${model.desc!.substring(0, 15)}...'
                            : model.desc!,
                      )),
                      Text('HTM Rp. ${model.htm}')
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
