// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kembang_belor_apps/features/news/domain/entities/programs.dart';

class ProgramModel extends ProgramEntity {
  const ProgramModel(
      {required super.id,
      required super.createAt,
      required super.tanggalMulai,
      required super.tanggalSelesai,
      required super.parentTourism});

  ProgramModel copyWith({
    int? id,
    DateTime? createAt,
    DateTime? tanggalMulai,
    DateTime? tanggalSelesai,
    Map<String, dynamic>? parentTourism,
  }) {
    return ProgramModel(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      tanggalMulai: tanggalMulai ?? this.tanggalMulai,
      tanggalSelesai: tanggalSelesai ?? this.tanggalSelesai,
      parentTourism: parentTourism ?? this.parentTourism,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createAt': createAt.millisecondsSinceEpoch,
      'tanggalMulai': tanggalMulai.millisecondsSinceEpoch,
      'tanggalSelesai': tanggalSelesai.millisecondsSinceEpoch,
      'parentTourism': parentTourism,
    };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map) {
    return ProgramModel(
        id: map['id'] as int,
        createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
        tanggalMulai:
            DateTime.fromMillisecondsSinceEpoch(map['tanggalMulai'] as int),
        tanggalSelesai:
            DateTime.fromMillisecondsSinceEpoch(map['tanggalSelesai'] as int),
        parentTourism: map['parentTourism'] != null
            ? Map<String, dynamic>.from(
                (map['parentTourism'] as Map<String, dynamic>))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory ProgramModel.fromJson(String source) =>
      ProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProgramModel(id: $id, createAt: $createAt, tanggalMulai: $tanggalMulai, tanggalSelesai: $tanggalSelesai, parentTourism: $parentTourism)';
  }

  @override
  bool operator ==(covariant ProgramModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createAt == createAt &&
        other.tanggalMulai == tanggalMulai &&
        other.tanggalSelesai == tanggalSelesai &&
        mapEquals(other.parentTourism, parentTourism);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createAt.hashCode ^
        tanggalMulai.hashCode ^
        tanggalSelesai.hashCode ^
        parentTourism.hashCode;
  }
}
