import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';

class TicketItem extends StatelessWidget {
  final TicketEntity entity;
  final bool isFromTicket;

  TicketItem({
    required this.entity,
    required this.isFromTicket,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detail_ticket',
          arguments: {'entity': entity, 'isFromTicket': isFromTicket}),
      child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: entity.imageUrl,
                cacheKey: '/tourism',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.tourism,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Berlaku hingga: \n',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontFamily: 'Poppins')),
                          TextSpan(
                              text: DateFormat('MMMM dd, yyyy')
                                  .format(entity.checkin_at),
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
              Text('${entity.qty} Tiket')
            ],
          ),
        ),
      ),
    );
  }
}
