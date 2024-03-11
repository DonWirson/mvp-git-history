import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/branch_entity.dart';
import '../repositories/commit_repository.dart';

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
