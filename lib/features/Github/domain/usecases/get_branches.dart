import 'package:dartz/dartz.dart';
import 'package:git_history/core/use_case/use_case.dart';
import 'package:git_history/features/Github/domain/entities/branch_entity.dart';
import 'package:git_history/features/Github/domain/repositories/commit_repository.dart';

import '../../../../core/failures/failures.dart';

class GetBranchesUseCase
    implements UseCase<Either<Failure, List<BranchEntity>>, void> {
  final CommitRepository _commitRepository;

  GetBranchesUseCase(
    this._commitRepository,
  );

  @override
  Future<Either<Failure, List<BranchEntity>>> call({params}) {
    return _commitRepository.getBranchtList();
  }
}
