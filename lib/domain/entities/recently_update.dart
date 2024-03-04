import 'package:equatable/equatable.dart';

class RecentlyFacilityEntity extends Equatable {
  final int? id;
  final String? facility_name;
  final String? imageUrl;
  final Map<String, dynamic>? parent_tourism;

  RecentlyFacilityEntity(
      {this.id, this.facility_name, this.imageUrl, this.parent_tourism});

  @override
  List<Object?> get props => [id, facility_name, imageUrl, parent_tourism];
}
