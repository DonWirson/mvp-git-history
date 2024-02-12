import 'package:get_it/get_it.dart';

import '../features/Github/data/datasources/remote/github_service.dart';

final getIt = GetIt.instance;

void setup() {
  //Services
  getIt.registerSingleton<GithubService>(GithubService());
}
