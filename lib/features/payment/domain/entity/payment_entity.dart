import 'dart:isolate';

import 'package:equatable/equatable.dart';

class GetPaymentEntity extends Equatable {
  final String token;
  final String redirected_url;

  GetPaymentEntity({required this.token, required this.redirected_url});

  @override
  List<Object?> get props => [token, redirected_url];
}
