part of 'check_payment_bloc.dart';

sealed class CheckPaymentState extends Equatable {
  const CheckPaymentState();

  @override
  List<Object> get props => [];
}

final class CheckPaymentInitial extends CheckPaymentState {}

final class CheckPaymentSucces extends CheckPaymentState {
  final String id;
  final TransactionResult result;
  final PaymentTourism data;

  const CheckPaymentSucces(
      {required this.id, required this.result, required this.data});
}

final class CheckPaymentFailed extends CheckPaymentState {}

final class InsertPaymentSucces extends CheckPaymentState {}

final class InsertPaymentFailure extends CheckPaymentState {}
