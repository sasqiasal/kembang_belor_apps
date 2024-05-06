import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final List<dynamic> event_needed;
  final DateTime event_started;
  final String nama_wisata;
  final String poster_url;
  final bool is_open;

  const EventEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.event_needed,
      required this.event_started,
      required this.nama_wisata,
      required this.poster_url,
      required this.is_open});

  @override
  List<Object?> get props =>
      [id, title, description, event_needed, event_started, nama_wisata, is_open];
}
