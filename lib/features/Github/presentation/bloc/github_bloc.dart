import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/branch_model.dart';
import '../../data/models/commit_history_model.dart';
import '../../data/models/commit_model.dart';
import '../../domain/usecases/get_all_commits.dart';
import '../../domain/usecases/get_branches.dart';
import '../../domain/usecases/get_commits_by_branch.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final GetCommitsByBranchUseCase _getCommitsByBranchUseCase;
  final GetBranchesUseCase _getBranchesUseCase;
  final GetAllCommitsUseCase _getAllCommitsUseCase;

  GithubBloc(
    this._getBranchesUseCase,
    this._getCommitsByBranchUseCase,
    this._getAllCommitsUseCase,
  ) : super(GithubInitial()) {
    on<GithubEvent>((event, emit) {});
    on<GotAllCommits>(getAllCommits);
    on<GotAllBranches>(getAllBranches);
    on<GotAllBranchCommits>(getAllCommitsByBranch);
  }

  Future<void> getAllCommits(
      GotAllCommits event, Emitter<GithubState> emit) async {
    emit(
      GotAllCommitsInProgress(),
    );
    await Future.delayed(const Duration(seconds: 2));

    final apiResponse = await _getAllCommitsUseCase();

    apiResponse.fold(
      (l) => emit(
        GotAllCommitsFailure(exception: l.message),
      ),
      (r) => emit(
        GotAllCommitsSuccessfully(commits: r as List<CommitModel>),
      ),
    );
  }

  Future<void> getAllBranches(
      GotAllBranches event, Emitter<GithubState> emit) async {
    emit(
      GotAllCommitsByBranchInProgress(),
    );
    await Future.delayed(const Duration(seconds: 2));
    final apiResponse = await _getBranchesUseCase();
    apiResponse.fold(
      (l) => emit(
        GotAllBranchesFailure(exception: l.toString()),
      ),
      (success) => emit(
        GotAllBranchesSuccessfully(branches: success as List<BranchModel>),
      ),
    );
  }

  Future<void> getAllCommitsByBranch(
      GotAllBranchCommits event, Emitter<GithubState> emit) async {
    emit(
      GotAllCommitsByBranchInProgress(),
    );
    await Future.delayed(const Duration(seconds: 2));
    final apiResponse =
        await _getCommitsByBranchUseCase(params: event.branchSha);
    apiResponse.fold(
      (l) => emit(
        GotAllCommitsByBranchFailure(exception: l.toString()),
      ),
      (r) => emit(
        GotAllCommitsByBranchSuccessfully(
            commitHistory: r as List<CommitHistoryModel>),
      ),
    );
  }
}
