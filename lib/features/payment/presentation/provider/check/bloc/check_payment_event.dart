part of 'check_payment_bloc.dart';

sealed class CheckPaymentEvent extends Equatable {
  const CheckPaymentEvent();

  @override
  List<Object> get props => [];
}

final class CheckPayment extends CheckPaymentEvent {
  final TransactionResult _result;
  final PaymentTourism _tourism;
  final User uuid;

  const CheckPayment(
    this._result,
    this._tourism,
    this.uuid,
  );
}
