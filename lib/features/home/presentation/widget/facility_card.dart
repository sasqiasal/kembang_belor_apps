// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  final Function()? onTap;
  final String imageUrl;
  const FacilityCard({
    super.key,
    this.onTap,
    this.imageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl.isEmpty
                  ? imageUrl
                  : 'assets/images/bernahdevalei.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Kolam Renang',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black26),
              child: const Icon(
                Icons.navigate_next_sharp,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
