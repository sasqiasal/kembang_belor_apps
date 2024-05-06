part of 'ticket_bloc.dart';

enum Status { initial, loading, empty, loaded, failure }

class TicketState extends Equatable {
  final Status status;
  final List<TicketEntity> data;
  const TicketState({required this.status, required this.data});

  factory TicketState.initial() => TicketState(
        status: Status.initial,
        data: [],
      );

  factory TicketState.loading() =>
      TicketState(data: [], status: Status.initial);
  TicketState copyWith({
    required Status? status,
    required List<TicketEntity>? data,
  }) =>
      TicketState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [status, data];
}
