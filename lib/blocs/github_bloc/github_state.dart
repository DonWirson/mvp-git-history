part of 'github_bloc.dart';

@immutable
sealed class GithubState {}

final class GithubInitial extends GithubState {}

final class GotAllBranchesInProgress extends GithubState {}

final class GotAllBranchesSuccessfull extends GithubState {
  final List<BranchModel> branches;

  GotAllBranchesSuccessfull({
    required this.branches,
  });
}

final class GotAllBranchesFailure extends GithubState {
  final String exception;

  GotAllBranchesFailure({
    required this.exception,
  });
}
