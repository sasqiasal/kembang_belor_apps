part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  final GetPaymentEntity? model;
  final String? error;
  const PaymentState({this.model, this.error});

  @override
  List<Object?> get props => [model, error];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSucess extends PaymentState {
  const PaymentSucess(GetPaymentEntity entity) : super(model: entity);
}

final class PaymentError extends PaymentState {
  const PaymentError(String error) : super(error: error);
}
