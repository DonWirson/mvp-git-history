import 'package:dartz/dartz.dart';
import '../entities/commit_entity.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/branch_model.dart';
import '../entities/commit_history_entity.dart';

abstract class CommitRepository {
  Future<Either<Failure, List<BranchModel>>> getBranchtList();

  Future<Either<Failure, List<CommitHistoryEntity>>> getCommitsByBranch(
      String branchName);

  Future<Either<Failure, List<CommitEntity>>> getAllCommits();
}
