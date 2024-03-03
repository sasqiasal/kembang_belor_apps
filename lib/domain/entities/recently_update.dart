import 'package:equatable/equatable.dart';

class RecentlyFacilityEntity extends Equatable {
  final int? id;
  final String? facilityName;
  final String? imageUrl;
  final String? parent_tourism_name;

  RecentlyFacilityEntity(
      {this.id, this.facilityName, this.imageUrl, this.parent_tourism_name});

  @override
  List<Object?> get props => [id, facilityName, imageUrl, parent_tourism_name];
}
