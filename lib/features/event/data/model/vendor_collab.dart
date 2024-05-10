import 'dart:convert';

import 'package:kembang_belor_apps/core/mixin/entity_convertible.dart';
import 'package:kembang_belor_apps/features/event/domain/entities/vendor_collab.dart';

class VendorCollabModel extends VendorCollabEntity {
  const VendorCollabModel(
      {required super.id,
      required super.user_id,
      required super.id_event,
      required super.needed_at,
      required super.is_accept,
      required super.title,
      required super.poster_url,
      required super.tanggal_daftar});

  VendorCollabModel copyWith(
      {int? id,
      String? user_id,
      int? id_event,
      String? needed_at,
      bool? is_accept,
      String? title,
      String? poster_url,
      DateTime? tanggal_daftar}) {
    return VendorCollabModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      id_event: id_event ?? this.id_event,
      needed_at: needed_at ?? this.needed_at,
      is_accept: is_accept ?? this.is_accept,
      title: title ?? this.title,
      poster_url: poster_url ?? this.poster_url,
      tanggal_daftar: tanggal_daftar ?? this.tanggal_daftar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'id_event': id_event,
      'needed_at': needed_at,
      'is_accept': is_accept,
      'title': title,
      'poster_url': poster_url,
      'tanggal_daftar': tanggal_daftar
    };
  }

  factory VendorCollabModel.fromMap(Map<String, dynamic> map) {
    return VendorCollabModel(
      id: map['id'] as int,
      user_id: map['user_id'] as String,
      id_event: map['id_event'] as int,
      needed_at: map['needed_at'] as String,
      is_accept: map['is_accept'] as bool,
      title: map['title'] as String,
      poster_url: map['poster_url'] as String,
      tanggal_daftar: DateTime.parse(map['tanggal_daftar']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorCollabModel.fromJson(String source) =>
      VendorCollabModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorCollabModel(id: $id, user_id: $user_id, id_event: $id_event, needed_at: $needed_at, is_accept: $is_accept, title: $title, poster_url: $poster_url, tanggal_daftar: $tanggal_daftar)';
  }

  @override
  bool operator ==(covariant VendorCollabModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.id_event == id_event &&
        other.needed_at == needed_at &&
        other.is_accept == is_accept &&
        other.title == title &&
        other.poster_url == poster_url &&
        other.tanggal_daftar == tanggal_daftar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        id_event.hashCode ^
        needed_at.hashCode ^
        is_accept.hashCode ^
        poster_url.hashCode ^
        tanggal_daftar.hashCode ^
        title.hashCode;
  }
}
