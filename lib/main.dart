import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/landing/landing_page.dart';

import 'blocs/github_bloc/github_bloc.dart';
import 'core/observer/app_bloc_observer.dart';
import 'screens/branches/branches_page.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  await dotenv.load(fileName: ".env");
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
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GithubBloc(),
        child: const LandingPage(),
      ),
    );
  }
}
