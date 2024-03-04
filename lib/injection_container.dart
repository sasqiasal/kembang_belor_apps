import 'package:get_it/get_it.dart';
import 'package:kembang_belor_apps/data/data_source/remote.dart';
import 'package:kembang_belor_apps/data/repository/tourism_repository_impl.dart';
import 'package:kembang_belor_apps/domain/repository/tourism_repository.dart';
import 'package:kembang_belor_apps/domain/usecases/get_recenly_facilities.dart';
import 'package:kembang_belor_apps/domain/usecases/get_tourism.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource());
  sl.registerSingleton<TourismRepository>(TourismRepositoryImpl(sl()));
  sl.registerSingleton<GetTourismUseCase>(GetTourismUseCase(sl()));
  sl.registerSingleton<GetRecentlyFaciliesUseCase>(
      GetRecentlyFaciliesUseCase(sl()));
}
