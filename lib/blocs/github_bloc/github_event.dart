part of 'github_bloc.dart';

@immutable
sealed class GithubEvent {}

final class GotAllCommits extends GithubEvent {}

final class GotAllBranches extends GithubEvent {}

final class GotAllBranchCommits extends GithubEvent {
  final String branchSha;
  GotAllBranchCommits({required this.branchSha});
}
