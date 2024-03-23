import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';

class PaymentTourism extends Equatable {
  final TourismEntity entity;
  final int qty;
  final DateTime date;

  const PaymentTourism(
      {required this.entity, required this.qty, required this.date});

  @override
  List<Object?> get props => [entity, qty, date];
}
