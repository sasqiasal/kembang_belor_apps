// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/domain/entities/recently_update.dart';

class RecentlyFacilityModel extends RecentlyFacilityEntity {
  RecentlyFacilityModel({
    int? id,
    String? facilityName,
    String? imageUrl,
    String? parent_tourism_name,
  }) : super(
            id: id,
            facilityName: facilityName,
            imageUrl: imageUrl,
            parent_tourism_name: parent_tourism_name);

  RecentlyFacilityModel copyWith({
    int? id,
    String? facilityName,
    String? imageUrl,
    String? parent_tourism_name,
  }) {
    return RecentlyFacilityModel(
      id: id ?? this.id,
      facilityName: facilityName ?? this.facilityName,
      imageUrl: imageUrl ?? this.imageUrl,
      parent_tourism_name: parent_tourism_name ?? this.parent_tourism_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'facilityName': facilityName,
      'imageUrl': imageUrl,
      'parent_tourism_name': parent_tourism_name,
    };
  }

  factory RecentlyFacilityModel.fromMap(Map<String, dynamic> map) {
    return RecentlyFacilityModel(
      id: map['id'] != null ? map['id'] as int : null,
      facilityName:
          map['facilityName'] != null ? map['facilityName'] as String : null,
      imageUrl:
          map['imageUrl'] != null ? map['imageUrl'] as String : kDefaultImage,
      parent_tourism_name: map['parent_tourism_name'] != null
          ? map['parent_tourism_name'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentlyFacilityModel.fromJson(String source) =>
      RecentlyFacilityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecentlyFacilityModel(id: $id, facilityName: $facilityName, imageUrl: $imageUrl, parent_tourism_name: $parent_tourism_name)';
  }

  @override
  bool operator ==(covariant RecentlyFacilityModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.facilityName == facilityName &&
        other.imageUrl == imageUrl &&
        other.parent_tourism_name == parent_tourism_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        facilityName.hashCode ^
        imageUrl.hashCode ^
        parent_tourism_name.hashCode;
  }
}
