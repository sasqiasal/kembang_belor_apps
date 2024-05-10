import 'package:equatable/equatable.dart';

class VendorCollabEntity extends Equatable {
  final int? id;
  final String user_id;
  final int id_event;
  final String needed_at;
  final bool? is_accept;
  final String? title;
  final DateTime? tanggal_daftar;
  final String? poster_url;

  const VendorCollabEntity(
      {required this.id,
      required this.user_id,
      required this.id_event,
      required this.needed_at,
      required this.is_accept,
      required this.title,
      required this.poster_url,
      required this.tanggal_daftar});

  @override
  @override
  List<Object?> get props => [id, user_id, id_event, needed_at];
}
