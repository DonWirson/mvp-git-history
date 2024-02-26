import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:git_history/core/injection_container.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/observer/app_bloc_observer.dart';
import 'features/Github/presentation/bloc/github_bloc.dart';
import 'screens/landing/landing_page.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  await dotenv.load(fileName: ".env");
  initializeDateFormatting();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 239, 239),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GithubBloc(
          getIt.get(),
          getIt.get(),
        ),
        child: const LandingPage(),
      ),
    );
  }
}
