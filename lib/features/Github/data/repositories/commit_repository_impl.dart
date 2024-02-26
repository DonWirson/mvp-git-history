import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:git_history/features/Github/data/datasources/remote/github_service.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repositories/commit_repository.dart';
import '../models/branch_model.dart';
import '../models/commit_history_model.dart';

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

  String exceptionHandler(Response response) {
    final errorMessage;
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
