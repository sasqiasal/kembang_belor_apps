part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventSucces extends EventState {
  final List<EventEntity> entity;

  const EventSucces(this.entity);
}

final class EventFailure extends EventState {
  final String exception;

  const EventFailure(this.exception);
}
