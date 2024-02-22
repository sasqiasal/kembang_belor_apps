import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/models/edited_pariwisata.dart';

class RecentlyUpdatedCard extends StatelessWidget {
  final String facilityName;
  final String imageUrl;
  final String parentTourism;
  const RecentlyUpdatedCard({
    super.key,
    required this.imageUrl,
    required this.facilityName,
    required this.parentTourism,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                facilityName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(parentTourism)
            ],
          ),
        )
      ]),
    );
  }
}
