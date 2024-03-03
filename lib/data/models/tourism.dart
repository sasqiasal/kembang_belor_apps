// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/domain/entities/tourism.dart';

class TourismModel extends TourismEntity {
  const TourismModel(
      {int? id, String? name, String? desc, int? htm, String? imageUrl})
      : super(id: id, name: name, desc: desc, htm: htm, imageUrl: imageUrl);

  TourismModel copyWith({
    int? id,
    String? name,
    String? desc,
    int? htm,
    String? imageUrl,
  }) {
    return TourismModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      htm: htm ?? this.htm,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'htm': htm,
      'imageUrl': imageUrl,
    };
  }

  factory TourismModel.fromMap(Map<String, dynamic> map) {
    return TourismModel(
      id: map['id'] != null ? map['id'] as int : 0,
      name: map['name'] != null ? map['name'] as String : '',
      desc: map['desc'] != null ? map['desc'] as String : '',
      htm: map['htm'] != null ? map['htm'] as int : 0,
      imageUrl:
          map['imageUrl'] != null ? map['imageUrl'] as String : kDefaultImage,
    );
  }

  String toJson() => json.encode(toMap());

  factory TourismModel.fromJson(String source) =>
      TourismModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TourismModel(id: $id, name: $name, desc: $desc, htm: $htm, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant TourismModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.htm == htm &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        htm.hashCode ^
        imageUrl.hashCode;
  }
}
