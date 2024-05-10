import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class TicketEntity extends Equatable {
  final String id;
  final DateTime checkin_at;
  final String user_id;
  final DateTime added_at;
  final bool is_checkin;
  final String tourism;
  final int qty;
  final int totalprice;
  final String imageUrl;
  const TicketEntity(
      {required this.id,
      required this.checkin_at,
      required this.user_id,
      required this.added_at,
      required this.is_checkin,
      required this.tourism,
      required this.qty,
      required this.totalprice,
      required this.imageUrl});

  @override
  List<Object?> get props =>
      [id, checkin_at, user_id, added_at, is_checkin, tourism];
}
