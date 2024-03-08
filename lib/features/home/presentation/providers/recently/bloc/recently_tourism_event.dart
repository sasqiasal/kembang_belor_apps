part of 'recently_tourism_bloc.dart';

sealed class RecentlyTourismEvent extends Equatable {
  const RecentlyTourismEvent();

  @override
  List<Object> get props => [];
}

final class RecentlyFacilityFected extends RecentlyTourismEvent{}
