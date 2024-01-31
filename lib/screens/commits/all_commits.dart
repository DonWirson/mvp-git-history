import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/github_bloc/github_bloc.dart';
import '../../models/commit_history_model.dart';

class AllCommits extends StatefulWidget {
  const AllCommits({super.key});

  @override
  State<AllCommits> createState() => _AllCommitsState();
}

class _AllCommitsState extends State<AllCommits> {
  List<CommitHistory> commitHistoryList = [];
  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listener: (context, state) {
        if (state is GotAllCommitsSuccessfully) {
          commitHistoryList = state.commitHistoryList;
        }
      },
      builder: (context, state) {
        if (state is GotAllCommitsSuccessfully) {
          return ListView.separated(
              itemCount: commitHistoryList.length,
              itemBuilder: (context, index) {
                final commit = commitHistoryList[index];
                return Column(children: [
                  Text(commit.url)
                ],);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 10,
                );
              });
        }
        return Placeholder();
      },
    );
  }
}
