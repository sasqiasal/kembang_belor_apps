part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class GetPaymentLink extends PaymentEvent {
  final Map<String, Object> params;

  const GetPaymentLink({required this.params});

  @override
  List<Object> get props => [params];
}

class SavePaymentPending extends PaymentEvent {
  final TransactionResult result;

  SavePaymentPending(this.result);
}
