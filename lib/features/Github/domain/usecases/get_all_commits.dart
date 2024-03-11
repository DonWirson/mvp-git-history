import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/commit_entity.dart';
import '../repositories/commit_repository.dart';

class GetAllCommitsUseCase
    implements UseCase<Either<Failure, List<CommitEntity>>, String> {
  final CommitRepository _commitRepository;

  GetAllCommitsUseCase(
    this._commitRepository,
  );

  @override
  Future<Either<Failure, List<CommitEntity>>> call({String? params}) {
    return _commitRepository.getAllCommits();
  }
}
