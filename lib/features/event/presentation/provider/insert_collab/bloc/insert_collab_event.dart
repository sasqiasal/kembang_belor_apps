part of 'insert_collab_bloc.dart';

sealed class InsertCollabEvent extends Equatable {
  const InsertCollabEvent();

  @override
  List<Object> get props => [];
}

final class InsertCollab extends InsertCollabEvent {
  final VendorCollabEntity entity;

  const InsertCollab({required this.entity});
}
