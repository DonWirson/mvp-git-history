import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repositories/commit_repository.dart';
import '../models/branch_model.dart';
import '../models/commit_history_model.dart';

class CommitRepositoryImpl extends CommitRepository {
  @override
  Future<Either<Failure, List<BranchModel>>> getBranchtList() {
    // TODO: implement getBranchtList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CommitHistoryModel>>> getCommitsByBranch(
      String branchName) {
    // TODO: implement getCommitsByBranch
    throw UnimplementedError();
  }
}
