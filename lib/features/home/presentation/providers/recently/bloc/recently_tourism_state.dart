part of 'recently_tourism_bloc.dart';

sealed class RecentlyTourismState extends Equatable {
  final List<RecentlyFacilityEntity>? model;
  final String? error;
  const RecentlyTourismState({this.model, this.error});

  @override
  List<Object?> get props => [model,error];
}

final class RecentlyTourismInitial extends RecentlyTourismState {}

final class RecentlyTourismLoading extends RecentlyTourismState {}

final class RecentlyTourismSuccess extends RecentlyTourismState {
  const RecentlyTourismSuccess({List<RecentlyFacilityEntity>? entities})
      : super(model: entities);
}

final class RecentlyTourismFailure extends RecentlyTourismState {
  const RecentlyTourismFailure(String error) : super(error: error);
}
