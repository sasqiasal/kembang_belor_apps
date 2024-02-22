import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class DetailFacility extends StatelessWidget {
  const DetailFacility({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        PanoramaViewer(
          child: Image.asset('assets/images/panorama.jpg'),
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
                      'Kolam Renang',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Kolam Renang Nyaman PPOLLLLL',
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.location_on))
              ],
            ),
          ),
          builder: (context, value, child) {
            return AnimatedContainer(
                duration: Durations.long1,
                height: value,
                decoration: BoxDecoration(
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
