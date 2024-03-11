import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/commit_history_entity.dart';
import '../repositories/commit_repository.dart';

class GetCommitsByBranchUseCase
    implements UseCase<Either<Failure, List<CommitHistoryEntity>>, String> {
  final CommitRepository _commitRepository;

  GetCommitsByBranchUseCase(
    this._commitRepository,
  );

  @override
  Future<Either<Failure, List<CommitHistoryEntity>>> call({String? params}) {
    return _commitRepository.getCommitsByBranch(params ?? "");
  }
}
