import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../entities/commit_history_entity.dart';
import '../../../../models/branch_model.dart';

abstract class CommitRepository {
  Future<Either<Failure, List<BranchModel>>> getBranchtList();
  Future<Either<Failure, List<CommitHistoryEntity>>> getCommitsByBranch(
      String branchName);
}
