import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/ticket.dart';

@Entity(tableName: 'ticket', primaryKeys: ['id'])
class TicketModel extends TicketEntity {
  TicketModel(
      {required super.id,
      required super.checkin_at,
      required super.user_id,
      required super.added_at,
      required super.is_checkin,
      required super.tourism,
      required super.qty,
      required super.totalprice,
      required super.imageUrl});

  TicketModel copyWith(
      {String? id,
      DateTime? checkin_at,
      String? user_id,
      DateTime? added_at,
      bool? is_checkin,
      String? tourism,
      int? qty,
      int? totalprice,
      String? imageUrl}) {
    return TicketModel(
        id: id ?? this.id,
        checkin_at: checkin_at ?? this.checkin_at,
        user_id: user_id ?? this.user_id,
        added_at: added_at ?? this.added_at,
        is_checkin: is_checkin ?? this.is_checkin,
        tourism: tourism ?? this.tourism,
        qty: qty ?? this.qty,
        totalprice: totalprice ?? this.totalprice,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkin_at': checkin_at.millisecondsSinceEpoch,
      'user_id': user_id,
      'added_at': added_at.millisecondsSinceEpoch,
      'is_checkin': is_checkin,
      'tourism': tourism,
      'qty': qty,
      'totalprice': totalprice,
      'imageUrl': imageUrl
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
        id: map['id'] as String,
        checkin_at: DateTime.parse(map['checkin_at'] as String),
        user_id: map['user_id'] as String,
        added_at: DateTime.parse(map['added_at'] as String),
        is_checkin: map['is_checkin'] as bool,
        tourism: map['tourism'] as String,
        qty: map['qty'] as int,
        totalprice: map['totalprice'] as int,
        imageUrl: map['imageUrl'] as String);
  }

  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
        id: entity.id,
        checkin_at: entity.checkin_at,
        user_id: entity.user_id,
        added_at: entity.added_at,
        is_checkin: entity.is_checkin,
        tourism: entity.tourism,
        qty: entity.qty,
        totalprice: entity.totalprice,
        imageUrl: entity.imageUrl);
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryPaymentModel(id: $id, checkin_at: $checkin_at, user_id: $user_id, added_at: $added_at, is_checkin: $is_checkin, tourism: $tourism, qty: $qty, totalprice: $totalprice)';
  }

  @override
  bool operator ==(covariant TicketModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.checkin_at == checkin_at &&
        other.user_id == user_id &&
        other.added_at == added_at &&
        other.is_checkin == is_checkin &&
        other.tourism == tourism &&
        other.qty == qty &&
        other.totalprice == totalprice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        checkin_at.hashCode ^
        user_id.hashCode ^
        added_at.hashCode ^
        is_checkin.hashCode ^
        tourism.hashCode ^
        qty.hashCode ^
        totalprice.hashCode;
  }
}
