import 'package:equatable/equatable.dart';

class RecentlyFacilityEntity extends Equatable {
  final int? id;
  final String? facilityName;
  final String? imageUrl;
  final String? parentTourism;
  final String? immersive_picture;

  const RecentlyFacilityEntity(
      {this.id,
      this.facilityName,
      this.imageUrl,
      this.parentTourism,
      this.immersive_picture});

  @override
  List<Object?> get props =>
      [id, facilityName, imageUrl, parentTourism, immersive_picture];
}
