import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../models/commit_history_model.dart';

import '../../models/branch_model.dart';
import '../../services/github_service.dart';

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
      //Only added this delay to show the Loading indicator :D
      await Future.delayed(const Duration(seconds: 2));
      final branches = await GithubService().getAllCommits();
      emit(
        GotAllCommitsSuccessfully(commitHistoryList: branches),
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
      final branches = await GithubService().getBranchtList();
      emit(
        GotAllBranchesSuccessfully(branches: branches),
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
      final commitHistory =
          await GithubService().getCommitBySha(event.branchSha);
      emit(
        GotAllCommitsByBranchSuccessfully(commitHistory: commitHistory),
      );
    } catch (e) {
      emit(
        GotAllCommitsByBranchFailure(exception: e.toString()),
      );
    }
  }
}
