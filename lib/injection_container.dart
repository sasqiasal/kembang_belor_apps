import 'package:get_it/get_it.dart';
import 'package:kembang_belor_apps/core/resources/observer/observer.dart';
import 'package:kembang_belor_apps/features/home/data/data_source/remote.dart';
import 'package:kembang_belor_apps/features/home/data/repository/tourism_repository_impl.dart';
import 'package:kembang_belor_apps/features/home/domain/repository/tourism_repository.dart';
import 'package:kembang_belor_apps/features/home/domain/usecases/get_recenly_facilities.dart';
import 'package:kembang_belor_apps/features/home/domain/usecases/get_tourism.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/data/repository/payment_impl.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/payment.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource());
  sl.registerSingleton<TourismRepository>(TourismRepositoryImpl(sl()));
  sl.registerSingleton<GetTourismUseCase>(GetTourismUseCase(sl()));
  sl.registerSingleton<GetRecentlyFaciliesUseCase>(
      GetRecentlyFaciliesUseCase(sl()));

  sl.registerSingleton<GetPaymentLinkDataSource>(GetPaymentLinkDataSource());
  sl.registerSingleton<PaymentRepository>(PaymentRepositoryImpl(sl()));
  sl.registerSingleton<GetPaymentLinkUseCase>(GetPaymentLinkUseCase(sl()));
}
