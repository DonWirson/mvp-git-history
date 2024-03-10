import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../features/Github/data/repositories/commit_repository_impl.dart';
import '../features/Github/domain/repositories/commit_repository.dart';
import '../features/Github/domain/usecases/get_all_commits.dart';
import '../features/Github/domain/usecases/get_branches.dart';
import '../features/Github/domain/usecases/get_commits_by_branch.dart';

import '../features/Github/data/datasources/remote/github_service.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //DIO
  getIt.registerSingleton<Dio>(
    Dio(),
  );
  //Services
  getIt.registerSingleton<GithubService>(
    GithubService(
      getIt<Dio>(),
    ),
  );
  //Repository
  getIt.registerSingleton<CommitRepository>(
    CommitRepositoryImpl(
      getIt<GithubService>(),
    ),
  );
  //Use cases
  getIt.registerSingleton<GetCommitsByBranchUseCase>(
    GetCommitsByBranchUseCase(
      getIt(),
    ),
  );
  getIt.registerSingleton<GetBranchesUseCase>(
    GetBranchesUseCase(
      getIt(),
    ),
  );
  getIt.registerSingleton<GetAllCommitsUseCase>(
    GetAllCommitsUseCase(
      getIt(),
    ),
  );
}
