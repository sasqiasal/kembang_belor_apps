// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/recently_update.dart';

class RecentlyFacilityModel extends RecentlyFacilityEntity {
  const RecentlyFacilityModel(
      {super.id,
      super.facilityName,
      super.imageUrl,
      super.parentTourism,
      super.immersive_picture});

  RecentlyFacilityModel copyWith(
      {int? id,
      String? facilityName,
      String? imageUrl,
      String? parentTourism,
      String? immersive_picture}) {
    return RecentlyFacilityModel(
      id: id ?? this.id,
      facilityName: facilityName ?? this.facilityName,
      imageUrl: imageUrl ?? this.imageUrl,
      parentTourism: parentTourism ?? this.parentTourism,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'facilityName': facilityName,
      'imageUrl': imageUrl,
      'parentTourism': parentTourism,
      'immersive_picture': immersive_picture
    };
  }

  factory RecentlyFacilityModel.fromMap(Map<String, dynamic> map) {
    return RecentlyFacilityModel(
        id: map['id'] != null ? map['id'] as int : null,
        facilityName:
            map['facilityName'] != null ? map['facilityName'] as String : null,
        imageUrl:
            map['imageUrl'] != null ? map['imageUrl'] as String : kDefaultImage,
        parentTourism: map['parentTourism'] != null
            ? map['parentTourism'] as String
            : null,
        immersive_picture: map['immersive_picture'] != null
            ? map['immersive_picture'] as String
            : kDefaultImage);
  }

  String toJson() => json.encode(toMap());

  factory RecentlyFacilityModel.fromJson(String source) =>
      RecentlyFacilityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecentlyFacilityModel(id: $id, facilityName: $facilityName, imageUrl: $imageUrl, parentTourism: $parentTourism, immersive_picture: $immersive_picture)';
  }

  @override
  bool operator ==(covariant RecentlyFacilityModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.facilityName == facilityName &&
        other.imageUrl == imageUrl &&
        other.parentTourism == parentTourism &&
        other.immersive_picture == immersive_picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        facilityName.hashCode ^
        imageUrl.hashCode ^
        immersive_picture.hashCode ^
        parentTourism.hashCode;
  }
}
