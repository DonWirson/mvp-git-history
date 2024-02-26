import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:git_history/features/Github/domain/usecases/get_branches.dart';
import 'package:git_history/features/Github/domain/usecases/get_commits_by_branch.dart';

import '../../data/models/branch_model.dart';
import '../../data/models/commit_history_model.dart';
import '../../data/models/commit_model.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final GetCommitsByBranchUseCase _getCommitsByBranchUseCase;
  final GetBranchesUseCase _getBranchesUseCase;

  GithubBloc(
    this._getBranchesUseCase,
    this._getCommitsByBranchUseCase,
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

    final apiResponse = await _getBranchesUseCase();
    Map<String, CommitModel> commitList = {};
    late List<BranchModel> success;
    apiResponse.fold(
        (l) => emit(
              GotAllCommitsFailure(exception: l.toString()),
            ),
        (r) => success = r as List<BranchModel>);

    late List<CommitHistoryModel> commitsModels;
    for (var i = 0; i < success.length; i++) {
      final commits =
          await _getCommitsByBranchUseCase(params: success[i].commit!.sha!);
      commits.fold(
          (l) => null, (r) => commitsModels = r as List<CommitHistoryModel>);
      for (var commitHistory in commitsModels) {
        commitList.putIfAbsent(commitHistory.commit!.tree!.sha!,
            () => commitHistory.commit! as CommitModel);
      }
    }

    final allCommitsSortedByDate = commitList.values.toList();
    allCommitsSortedByDate.sort(
      (a, b) => b.committer!.date!.compareTo(a.committer!.date!),
    );

    emit(
      GotAllCommitsSuccessfully(commits: allCommitsSortedByDate),
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
