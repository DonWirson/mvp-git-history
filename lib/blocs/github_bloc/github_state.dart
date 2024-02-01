part of 'github_bloc.dart';

@immutable
sealed class GithubState {}

final class GithubInitial extends GithubState {}

final class GotAllCommitsInProgress extends GithubState {}

final class GotAllCommitsSuccessfully extends GithubState {
  final List<Commit> commits;

  GotAllCommitsSuccessfully({
    required this.commits,
  });
}

final class GotAllCommitsFailure extends GithubState {
  final String exception;

  GotAllCommitsFailure({
    required this.exception,
  });
}

final class GotAllBranchesInProgress extends GithubState {}

final class GotAllBranchesSuccessfully extends GithubState {
  final List<BranchModel> branches;

  GotAllBranchesSuccessfully({
    required this.branches,
  });
}

final class GotAllBranchesFailure extends GithubState {
  final String exception;

  GotAllBranchesFailure({
    required this.exception,
  });
}

final class GotAllCommitsByBranchInProgress extends GithubState {}

final class GotAllCommitsByBranchSuccessfully extends GithubState {
  final List<CommitHistory> commitHistory;

  GotAllCommitsByBranchSuccessfully({
    required this.commitHistory,
  });
}

final class GotAllCommitsByBranchFailure extends GithubState {
  final String exception;

  GotAllCommitsByBranchFailure({
    required this.exception,
  });
}
