import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/branch_model.dart';
import '../../services/github_service.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(GithubInitial()) {
    on<GithubEvent>((event, emit) {});
    on<GotAllBranches>(getAllBranches);
  }

  Future<void> getAllBranches(
      GotAllBranches event, Emitter<GithubState> emit) async {
    try {
      emit(
        GotAllBranchesInProgress(),
      );
      final branches = await GithubService().getBranchtList();
      emit(
        GotAllBranchesSuccessfull(branches: branches),
      );
    } catch (e) {
      emit(
        GotAllBranchesFailure(exception: e.toString()),
      );
    }
  }
}
