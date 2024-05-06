part of 'history_payment_bloc.dart';

sealed class HistoryPaymentEvent extends Equatable {
  const HistoryPaymentEvent();

  @override
  List<Object> get props => [];
}

final class HistoryPaymentFetch extends HistoryPaymentEvent {
  final String uuid;

  HistoryPaymentFetch({required this.uuid});
}
