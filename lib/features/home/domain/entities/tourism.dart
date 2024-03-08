import 'package:equatable/equatable.dart';

class TourismEntity extends Equatable {
  final int? id;
  final String? name;
  final String? desc;
  final int? htm;
  final String? imageUrl;
  const TourismEntity({
    this.id,
    this.name,
    this.desc,
    this.htm,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, desc, htm, imageUrl];
}
