import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/config/router/route.dart';
import 'package:kembang_belor_apps/config/theme/theme.dart';
import 'package:kembang_belor_apps/core/constant/constant.dart';
import 'package:kembang_belor_apps/injection_container.dart';
import 'package:kembang_belor_apps/pages/main_page.dart';
import 'package:kembang_belor_apps/providers/home/bloc/tourism_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(url: projectUrl, anonKey: anonKey);
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TourismBloc(sl()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const MainPage(),
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
