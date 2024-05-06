import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kembang_belor_apps/config/router/route.dart';
import 'package:kembang_belor_apps/config/theme/theme.dart';
import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/core/resources/observer/observer.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/login/bloc/login_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/register/bloc/register_bloc.dart';
import 'package:kembang_belor_apps/features/event/presentation/provider/get_event/bloc/event_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/history/bloc/history_payment_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/payment/bloc/payment_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/check/bloc/check_payment_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/ticket/bloc/ticket_bloc.dart';
import 'package:kembang_belor_apps/injection_container.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/recently/bloc/recently_tourism_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/tourism/bloc/tourism_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: projectUrl, anonKey: anonKey);
  await dotenv.load(fileName: ".env");
  initializeDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => AuthBloc(sl())..add(AuthInitialCheckRequested()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TourismBloc(sl()),
        ),
        BlocProvider(
          create: (context) => RecentlyTourismBloc(sl()),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(sl()),
        ),
        BlocProvider(create: (context) => LoginBloc(sl())),
        BlocProvider(create: (context) => RegisterBloc(sl())),
        BlocProvider(create: (context) => AuthBloc(sl())),
        BlocProvider(create: (context) => CheckPaymentBloc(sl())),
        BlocProvider(create: (context) => EventBloc(sl())..add(EventFetch())),
        BlocProvider(create: (context) => HistoryPaymentBloc(sl())),
        BlocProvider(create: (context) => TicketBloc(sl()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [Locale('id', '')],
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        home: BlocConsumer<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is AuthUserUnauthenticated) {
              Navigator.of(context).pushReplacementNamed('/login');
            }
            if (state is AuthUserAuthenticated) {
              Navigator.of(context).pushReplacementNamed('/home');
            }
          },
          builder: (BuildContext context, AuthStates state) {
            return const Placeholder();
          },
        ),
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
