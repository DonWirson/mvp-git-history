import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repositories/commit_repository.dart';
import '../datasources/remote/github_service.dart';
import '../models/branch_model.dart';
import '../models/commit_history_model.dart';
import '../models/commit_model.dart';

class CommitRepositoryImpl implements CommitRepository {
  final GithubService _githubService;

  CommitRepositoryImpl(
    this._githubService,
  );

  @override
  Future<Either<Failure, List<BranchModel>>> getBranchtList() async {
    try {
      final apiResponse = await _githubService.getBranchtList();

      if (apiResponse.response.statusCode == 200) {
        return Right(
          apiResponse.data,
        );
      } else {
        throw (
          Exception(
            exceptionHandler(
              apiResponse.response,
            ),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CommitHistoryModel>>> getCommitsByBranch(
      String branchName) async {
    try {
      final apiResponse = await _githubService.getCommitsByBranch(
        branchName,
      );
      if (apiResponse.response.statusCode == 200) {
        return Right(
          apiResponse.data,
        );
      } else {
        throw (
          Exception(
            exceptionHandler(
              apiResponse.response,
            ),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CommitModel>>> getAllCommits() async {
    try {
      Map<String, CommitModel> commitList = {};
      List<CommitHistoryModel> commitHistoryList = [];
      late List<BranchModel> branchList;

      final apiResponse = await getBranchtList();
      if (apiResponse.isRight()) {
        branchList = apiResponse.getOrElse(() => []);
      }

      for (var i = 0; i < branchList.length; i++) {
        final commits = await getCommitsByBranch(
          branchList[i].commit!.sha!,
        );
        if (commits.isRight()) {
          commitHistoryList = commits.getOrElse(() => []);
        }
        for (var commitHistory in commitHistoryList) {
          commitList.putIfAbsent(commitHistory.commit!.tree!.sha!,
              () => commitHistory.commit! as CommitModel);
        }
      }

      final allCommitsSortedByDate = commitList.values.toList();
      allCommitsSortedByDate.sort(
        (a, b) => b.committer!.date!.compareTo(a.committer!.date!),
      );
      return Right(allCommitsSortedByDate);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  String exceptionHandler(Response response) {
    final String errorMessage;
    switch (response.statusCode) {
      case 400:
        errorMessage = "Bad request";
        break;
      case 401:
        errorMessage = "Unauthorized";
        break;
      case 403:
        errorMessage = "Server denied the request";
        break;
      case 404:
        errorMessage = "Not found";
        break;
      case 500:
        errorMessage = "Server error";
        break;
      case 502:
        errorMessage = "Server unavailable at the moment";
        break;
      case 503:
        errorMessage = "Service unavailable at the moment";
      default:
        errorMessage = "An error occurred";
        break;
    }
    return errorMessage;
  }
}
