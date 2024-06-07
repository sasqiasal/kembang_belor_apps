part of 'collab_history_bloc.dart';

enum Status { initial, loading, empty, loaded, failure }

class CollabHistoryState extends Equatable {
  final Status status;
  final List<VendorCollabEntity> data;
  const CollabHistoryState({required this.status, required this.data});

  factory CollabHistoryState.initial() => const CollabHistoryState(
        status: Status.initial,
        data: [],
      );

  factory CollabHistoryState.loading() =>
      const CollabHistoryState(data: [], status: Status.initial);
  CollabHistoryState copyWith({
    required Status? status,
    required List<VendorCollabEntity>? data,
  }) =>
      CollabHistoryState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [status, data];
}
