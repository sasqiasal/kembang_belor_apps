import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/home/presentation/widget/facility_card.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Klurak Eco Park'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FacilityCard(
              onTap: () => Navigator.of(context).pushNamed('/detail_facility'),
              imageUrl: 'assets/images/logoklurak.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
