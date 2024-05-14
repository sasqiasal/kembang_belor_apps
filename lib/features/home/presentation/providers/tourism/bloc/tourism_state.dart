part of 'tourism_bloc.dart';

sealed class TourismState extends Equatable {
  final List<TourismEntity>? model;
  final String? error;

  const TourismState({this.model, this.error});
  @override
  List<Object?> get props => [model, error];
}

final class TourismInitial extends TourismState {}

final class TourismLoading extends TourismState {}

final class TourismSuccess extends TourismState {
  const TourismSuccess(List<TourismEntity>? entities) : super(model: entities);
}

final class TourismFailure extends TourismState {
  const TourismFailure(String error) : super(error: error);
}
