part of 'github_bloc.dart';

@immutable
sealed class GithubEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GotAllCommits extends GithubEvent {}

final class GotAllBranches extends GithubEvent {}

final class GotAllBranchCommits extends GithubEvent {
  final String branchSha;
  GotAllBranchCommits({required this.branchSha});
  @override
  List<Object?> get props => [branchSha];
}
