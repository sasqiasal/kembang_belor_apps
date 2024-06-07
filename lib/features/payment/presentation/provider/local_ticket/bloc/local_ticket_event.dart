part of 'local_ticket_bloc.dart';

sealed class LocalTicketEvent extends Equatable {
  final TicketEntity? entity;
  const LocalTicketEvent({this.entity});

  @override
  List<Object> get props => [];
}

class GetSavedTicket extends LocalTicketEvent {
  const GetSavedTicket();
}

class InsertTicket extends LocalTicketEvent {
  const InsertTicket(TicketEntity entity) : super(entity: entity);
}

class RemoveTicket extends LocalTicketEvent {
  const RemoveTicket(TicketEntity entity) : super(entity: entity);
}
