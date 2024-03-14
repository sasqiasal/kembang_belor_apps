import 'package:equatable/equatable.dart';

class ProgramEntity extends Equatable {
  final int id;
  final DateTime createAt;
  final DateTime tanggalMulai;
  final DateTime tanggalSelesai;
  final Map<String, dynamic>? parentTourism;

  const ProgramEntity(
      {required this.id,
      required this.createAt,
      required this.tanggalMulai,
      required this.tanggalSelesai,
      required this.parentTourism});

  @override
  List<Object?> get props =>
      [id, createAt, tanggalMulai, tanggalSelesai, parentTourism];
}
