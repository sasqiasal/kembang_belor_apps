// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:kembang_belor_apps/features/event/domain/entities/event.dart';

class EventModel extends EventEntity {
  const EventModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.event_needed,
      required super.event_started,
      required super.nama_wisata,
      required super.poster_url,
      required super.is_open});

  EventModel copyWith(
      {int? id,
      String? title,
      String? description,
      Map? event_needed,
      DateTime? event_started,
      String? nama_wisata,
      String? poster_url,
      bool? is_open}) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      event_needed: event_needed ?? this.event_needed,
      event_started: event_started ?? this.event_started,
      nama_wisata: nama_wisata ?? this.nama_wisata,
      poster_url: poster_url ?? this.poster_url,
      is_open: is_open ?? this.is_open,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'event_needed': event_needed,
      'event_started': event_started.millisecondsSinceEpoch,
      'nama_wisata': nama_wisata,
      'poster_url': poster_url,
      'is_open': is_open
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      event_needed: map['event_needed'],
      event_started: DateTime.parse(map['event_started']),
      nama_wisata: map['nama_wisata'] as String,
      poster_url: map['poster_url'] as String,
      is_open: map['is_open'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, event_needed: $event_needed, event_started: $event_started, nama_wisata: $nama_wisata, poster_url: $poster_url, is_open: $is_open)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.event_needed == other.event_needed &&
        other.event_started == event_started &&
        other.nama_wisata == nama_wisata &&
        other.poster_url == poster_url &&
        other.is_open == is_open;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        event_needed.hashCode ^
        event_started.hashCode ^
        nama_wisata.hashCode ^
        is_open.hashCode ^
        poster_url.hashCode;
  }
}
