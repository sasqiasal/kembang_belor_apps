import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/pages/detail_facility_page.dart';
import 'package:kembang_belor_apps/widget/facility_card.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Klurak Eco Park'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FacilityCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailFacility(),
              )),
              imageUrl: 'assets/images/logoklurak.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
