part of 'local_ticket_bloc.dart';

sealed class LocalTicketState extends Equatable {
  final List<TicketEntity>? entity;

  const LocalTicketState({this.entity});

  @override
  List<Object> get props => [];
}

final class LocalTicketInitial extends LocalTicketState {}

final class LocalTicketDone extends LocalTicketState {
  const LocalTicketDone(List<TicketEntity> entity) : super(entity: entity);
}

final class LocalTicketFailure extends LocalTicketState {}
