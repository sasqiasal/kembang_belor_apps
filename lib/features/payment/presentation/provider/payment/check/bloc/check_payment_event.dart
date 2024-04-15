part of 'check_payment_bloc.dart';

sealed class CheckPaymentEvent extends Equatable {
  const CheckPaymentEvent();

  @override
  List<Object> get props => [];
}

final class CheckPayment extends CheckPaymentEvent {
  final TransactionResult _result;
  final PaymentTourism _tourism;

  const CheckPayment(this._result, this._tourism);
}

final class InsertPayment extends CheckPaymentEvent {
  final String id;
  final TransactionResult result;
  final User uuid;
  final PaymentTourism data;

  InsertPayment(
      {required this.uuid,
      required this.id,
      required this.result,
      required this.data});
}
