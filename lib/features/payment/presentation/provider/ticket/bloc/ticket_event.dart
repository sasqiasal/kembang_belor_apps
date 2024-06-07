part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

final class MyTicketFetch extends TicketEvent {
  final String uuid;

  const MyTicketFetch({required this.uuid});
}
