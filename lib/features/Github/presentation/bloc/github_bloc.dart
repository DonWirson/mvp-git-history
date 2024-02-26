import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/remote/github_service.dart';
import '../../data/models/branch_model.dart';
import '../../data/models/commit_history_model.dart';
import '../../data/models/commit_model.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(GithubInitial()) {
    on<GithubEvent>((event, emit) {});
    on<GotAllCommits>(getAllCommits);
    on<GotAllBranches>(getAllBranches);
    on<GotAllBranchCommits>(getAllCommitsByBranch);
  }

  Future<void> getAllCommits(
      GotAllCommits event, Emitter<GithubState> emit) async {
    try {
      emit(
        GotAllCommitsInProgress(),
      );
      await Future.delayed(const Duration(seconds: 2));

      final apiResponse = await GithubService().getBranchtList();
      Map<String, CommitModel> commitList = {};

      for (var i = 0; i < apiResponse.data.length; i++) {
        final commits = await GithubService()
            .getCommitsByBranch(apiResponse.data[i].commit!.sha!);
        for (var commitHistory in commits.data) {
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
    } catch (e) {
      emit(
        GotAllCommitsFailure(exception: e.toString()),
      );
    }
  }

  Future<void> getAllBranches(
      GotAllBranches event, Emitter<GithubState> emit) async {
    try {
      emit(
        GotAllCommitsByBranchInProgress(),
      );
      //Only added this delay to show the Loading indicator :D
      await Future.delayed(const Duration(seconds: 2));
      final apiResponse = await GithubService().getBranchtList();
      emit(
        GotAllBranchesSuccessfully(branches: apiResponse.data),
      );
    } catch (e) {
      emit(
        GotAllBranchesFailure(exception: e.toString()),
      );
    }
  }

  Future<void> getAllCommitsByBranch(
      GotAllBranchCommits event, Emitter<GithubState> emit) async {
    try {
      emit(
        GotAllCommitsByBranchInProgress(),
      );
      //Only added this delay to show the Loading indicator :D
      await Future.delayed(const Duration(seconds: 2));
      final apiResponse =
          await GithubService().getCommitsByBranch(event.branchSha);
      emit(
        GotAllCommitsByBranchSuccessfully(commitHistory: apiResponse.data),
      );
    } catch (e) {
      emit(
        GotAllCommitsByBranchFailure(exception: e.toString()),
      );
    }
  }
}
