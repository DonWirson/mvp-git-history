import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/loading_indicator.dart';
import '../../data/models/commit_model.dart';
import '../bloc/github_bloc.dart';
import '../widgets/all_commits_failure.dart';
import '../widgets/all_commits_successfull.dart';

class AllCommmitsPage extends StatefulWidget {
  const AllCommmitsPage({super.key});

  @override
  State<AllCommmitsPage> createState() => _AllCommmitsPageState();
}

class _AllCommmitsPageState extends State<AllCommmitsPage> {
  List<CommitModel> commitList = [];

  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listener: (context, state) {
        if (state is GotAllCommitsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception),
            ),
          );
        }
        if (state is GotAllCommitsSuccessfully) {
          commitList = state.commits;
        }
      },
      builder: (context, state) {
        if (state is GotAllCommitsFailure) {
          return const AllCommitsFailure();
        }
        if (state is GotAllCommitsSuccessfully) {
          return AllCommitsSuccessfull(commitList: commitList);
        }
        return const LoadingIndicator();
      },
    );
  }
}
