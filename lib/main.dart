import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/config/router/route.dart';
import 'package:kembang_belor_apps/config/theme/theme.dart';
import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/core/resources/observer/observer.dart';
import 'package:kembang_belor_apps/injection_container.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/main_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/recently/bloc/recently_tourism_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/tourism/bloc/tourism_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: projectUrl, anonKey: anonKey);

  initializeDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const MainPage(),
        initialRoute: '/',
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
