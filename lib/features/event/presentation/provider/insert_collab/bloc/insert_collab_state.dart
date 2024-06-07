part of 'insert_collab_bloc.dart';

sealed class InsertCollabState extends Equatable {
  const InsertCollabState();

  @override
  List<Object> get props => [];
}

final class InsertCollabInitial extends InsertCollabState {}

final class InsertCollabLoading extends InsertCollabState {}

final class InsertCollabSuccess extends InsertCollabState {}


final class InsertCollabFailure extends InsertCollabState {}
