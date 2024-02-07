import 'package:get_it/get_it.dart';
import 'package:git_history/services/github_service.dart';

final getIt = GetIt.instance;

void setup() {
  //Services
  getIt.registerSingleton<GithubService>(GithubService());
}
