import 'package:equatable/equatable.dart';

class RecentlyFacilityEntity extends Equatable {
  final int? id;
  final String? facilityName;
  final String? imageUrl;
  final Map<String, dynamic>? parentTourism;

  const RecentlyFacilityEntity(
      {this.id, this.facilityName, this.imageUrl, this.parentTourism});

  @override
  List<Object?> get props => [id, facilityName, imageUrl, parentTourism];
}
