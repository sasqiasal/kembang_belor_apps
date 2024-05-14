part of 'collab_history_bloc.dart';

sealed class CollabHistoryEvent extends Equatable {
  const CollabHistoryEvent();

  @override
  List<Object> get props => [];
}

final class FetchCollabHistory extends CollabHistoryEvent {
  final String uuid;

  const FetchCollabHistory(this.uuid);
}
