// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class GetPaymentEntity extends Equatable {
  final String token;
  final String redirect_url;

  const GetPaymentEntity({required this.token, required this.redirect_url});

  @override
  List<Object?> get props => [token, redirect_url];
}
