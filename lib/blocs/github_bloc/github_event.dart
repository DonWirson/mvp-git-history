part of 'github_bloc.dart';

@immutable
sealed class GithubEvent {}

final class GotAllBranches extends GithubEvent {}
