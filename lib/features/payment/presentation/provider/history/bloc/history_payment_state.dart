part of 'history_payment_bloc.dart';

enum Status { initial, loading, empty, loaded, failure }

class HistoryPaymentState extends Equatable {
  final Status status;
  final List<TicketEntity> data;
  const HistoryPaymentState({required this.status, required this.data});

  factory HistoryPaymentState.initial() => HistoryPaymentState(
        status: Status.initial,
        data: [],
      );

  factory HistoryPaymentState.loading() =>
      HistoryPaymentState(data: [], status: Status.initial);
  HistoryPaymentState copyWith({
    required Status? status,
    required List<TicketEntity>? data,
  }) =>
      HistoryPaymentState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [status, data];
}
