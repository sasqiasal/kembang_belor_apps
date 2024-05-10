import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';
import 'package:kembang_belor_apps/features/event/presentation/widget/action_button.dart';
import 'package:kembang_belor_apps/features/event/presentation/widget/expandable_fab.dart';

class DetailEventPage extends StatelessWidget {
  final EventEntity entity;
  const DetailEventPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(entity.title),
        ),
        body: Column(
          children: [
            CachedNetworkImage(
              imageUrl: entity.poster_url,
              cacheKey: '/tourism',
              imageBuilder: (context, imageProvider) => Container(
                height: 150,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            Text(entity.description)
          ],
        ));
  }
}

createTexttextfields(List<dynamic> list) {
  var actionButton = <ActionButton>[];

  list.forEach((i) {
    var textEditingController = new TextEditingController(text: "test $i");
    return actionButton.add(ActionButton(icon: Icon(Icons.celebration)));
  });
  return actionButton;
}
