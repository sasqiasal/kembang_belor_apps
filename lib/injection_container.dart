import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kembang_belor_apps/features/auth/data/repository/authentication_repository.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/login/bloc/login_bloc.dart';
import 'package:kembang_belor_apps/features/event/data/data_source/remote/event_data.dart';
import 'package:kembang_belor_apps/features/event/data/repository/event_repository_impl.dart';
import 'package:kembang_belor_apps/features/event/domain/repository/event_repository.dart';
import 'package:kembang_belor_apps/features/event/domain/usecase/get_event.dart';
import 'package:kembang_belor_apps/features/home/data/data_source/remote.dart';
import 'package:kembang_belor_apps/features/home/data/repository/tourism_repository_impl.dart';
import 'package:kembang_belor_apps/features/home/domain/repository/tourism_repository.dart';
import 'package:kembang_belor_apps/features/home/domain/usecases/get_recenly_facilities.dart';
import 'package:kembang_belor_apps/features/home/domain/usecases/get_tourism.dart';
import 'package:kembang_belor_apps/features/payment/data/data_source/payment.dart';
import 'package:kembang_belor_apps/features/payment/data/repository/payment_impl.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> initializeDependencies() async {
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource());
  sl.registerSingleton<TourismRepository>(TourismRepositoryImpl(sl()));
  sl.registerSingleton<GetTourismUseCase>(GetTourismUseCase(sl()));
  sl.registerSingleton<GetRecentlyFaciliesUseCase>(
      GetRecentlyFaciliesUseCase(sl()));

  sl.registerSingleton<GetPaymentLinkDataSource>(GetPaymentLinkDataSource());
  sl.registerSingleton<PaymentRepository>(PaymentRepositoryImpl(sl()));
  sl.registerSingleton<GetPaymentLinkUseCase>(GetPaymentLinkUseCase(sl()));

  sl.registerSingleton(Supabase.instance.client.auth);

  sl.registerSingleton<IAuthenticationRepository>(
      AuthenticationRepository(sl()));

  sl.registerSingleton<AuthBloc>(AuthBloc(sl()));

  sl.registerSingleton<LoginBloc>(LoginBloc(sl()));

  sl.registerSingleton<EventDataSource>(EventDataSource());
  sl.registerSingleton<EventRepository>(EventRepositoryImpl(sl()));
  sl.registerSingleton<GetEventUseCase>(GetEventUseCase(sl()));
}
