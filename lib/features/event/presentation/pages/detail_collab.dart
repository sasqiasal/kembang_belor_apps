import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';

class DetailCollabPage extends StatefulWidget {
  final EventEntity entity;

  const DetailCollabPage({super.key, required this.entity});

  @override
  State<DetailCollabPage> createState() => _DetailCollabPageState();
}

class _DetailCollabPageState extends State<DetailCollabPage> {
  String? _event;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: widget.entity.poster_url,
              imageBuilder: (context, imageProvider) => Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.entity.title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'Dibutuhkan untuk keperluan event berikut ini : ',
                    textAlign: TextAlign.center,
                  ),
                  ListView.builder(
                    itemCount: widget.entity.event_needed.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      title: Center(
                          child: Text(widget.entity.event_needed[index])),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Pilih Bagian Event'),
                        ListView.builder(
                          itemCount: widget.entity.event_needed.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => RadioListTile(
                            title: Text(widget.entity.event_needed[index]),
                            value: widget.entity.event_needed[index],
                            groupValue: _event,
                            onChanged: (value) {
                              setState(
                                () => _event = value,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Batal'),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Daftar"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              child: Text('Daftar Sekarang'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                    double.infinity, 50), // Set minimum width and height
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 240,
          child: SizedBox.expand(child: FlutterLogo()),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
