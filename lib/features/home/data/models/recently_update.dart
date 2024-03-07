// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/recently_update.dart';

class RecentlyFacilityModel extends RecentlyFacilityEntity {
  RecentlyFacilityModel({
    int? id,
    String? facility_name,
    String? imageUrl,
    Map<String, dynamic>? parent_tourism,
  }) : super(
            id: id,
            facility_name: facility_name,
            imageUrl: imageUrl,
            parent_tourism: parent_tourism);

  RecentlyFacilityModel copyWith({
    int? id,
    String? facility_name,
    String? imageUrl,
    Map<String, dynamic>? parent_tourism,
  }) {
    return RecentlyFacilityModel(
      id: id ?? this.id,
      facility_name: facility_name ?? this.facility_name,
      imageUrl: imageUrl ?? this.imageUrl,
      parent_tourism: parent_tourism ?? this.parent_tourism,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'facility_name': facility_name,
      'imageUrl': imageUrl,
      'parent_tourism': parent_tourism,
    };
  }

  factory RecentlyFacilityModel.fromMap(Map<String, dynamic> map) {
    return RecentlyFacilityModel(
      id: map['id'] != null ? map['id'] as int : null,
      facility_name:
          map['facility_name'] != null ? map['facility_name'] as String : null,
      imageUrl:
          map['imageUrl'] != null ? map['imageUrl'] as String : kDefaultImage,
      parent_tourism: map['parent_tourism'] != null
          ? map['parent_tourism'] as Map<String, dynamic>
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentlyFacilityModel.fromJson(String source) =>
      RecentlyFacilityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecentlyFacilityModel(id: $id, facility_name: $facility_name, imageUrl: $imageUrl, parent_tourism: $parent_tourism)';
  }

  @override
  bool operator ==(covariant RecentlyFacilityModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.facility_name == facility_name &&
        other.imageUrl == imageUrl &&
        other.parent_tourism == parent_tourism;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        facility_name.hashCode ^
        imageUrl.hashCode ^
        parent_tourism.hashCode;
  }
}
