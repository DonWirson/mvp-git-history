part of 'github_bloc.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object> get props => [];
}

class GithubInitial extends GithubState {}

final class GotAllCommitsInProgress extends GithubState {}

final class GotAllCommitsSuccessfully extends GithubState {
  final List<CommitModel> commits;

  const GotAllCommitsSuccessfully({
    required this.commits,
  });
  @override
  List<Object> get props => [commits];
}

final class GotAllCommitsFailure extends GithubState {
  final String exception;

  const GotAllCommitsFailure({
    required this.exception,
  });
  @override
  List<Object> get props => [exception];
}

final class GotAllBranchesInProgress extends GithubState {}

final class GotAllBranchesSuccessfully extends GithubState {
  final List<BranchModel> branches;

  const GotAllBranchesSuccessfully({
    required this.branches,
  });
  @override
  List<Object> get props => [branches];
}

final class GotAllBranchesFailure extends GithubState {
  final String exception;

  const GotAllBranchesFailure({
    required this.exception,
  });
  @override
  List<Object> get props => [exception];
}

final class GotAllCommitsByBranchInProgress extends GithubState {}

final class GotAllCommitsByBranchSuccessfully extends GithubState {
  final List<CommitHistoryModel> commitHistory;

  const GotAllCommitsByBranchSuccessfully({
    required this.commitHistory,
  });
  @override
  List<Object> get props => [commitHistory];
}

final class GotAllCommitsByBranchFailure extends GithubState {
  final String exception;

  const GotAllCommitsByBranchFailure({
    required this.exception,
  });

  @override
  List<Object> get props => [exception];
}
