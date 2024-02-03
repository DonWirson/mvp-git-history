import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/github_bloc/github_bloc.dart';
import '../../core/loading_indicator.dart';
import '../../models/commit_history_model.dart';

class AllCommits extends StatefulWidget {
  const AllCommits({super.key});

  @override
  State<AllCommits> createState() => _AllCommitsState();
}

class _AllCommitsState extends State<AllCommits> {
  List<Commit> commitList = [];
  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.only(top: 8);
    return BlocConsumer<GithubBloc, GithubState>(
      listener: (context, state) {
        if (state is GotAllCommitsSuccessfully) {
          commitList = state.commits;
        }
      },
      builder: (context, state) {
        if (state is GotAllCommitsSuccessfully) {
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.separated(
              itemCount: commitList.length,
              itemBuilder: (context, index) {
                final commit = commitList[index];
                final date = DateFormat("dd-MM-yyyy")
                    .format(commit.committer.date)
                    .toString();
                final hour = DateFormat("HH:mm")
                    .format(commit.committer.date)
                    .toString();
                return ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  tileColor: Colors.white,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Padding(
                        padding: padding,
                        child: Text(
                          "Commiter:",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Text(
                        commit.author.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  title: Text(
                    commit.message,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: padding,
                        child: Text(
                          date,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Padding(
                        padding: padding,
                        child: Text(
                          hour,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Icon(Icons.arrow_downward),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }
        return const LoadingIndicator();
      },
    );
  }

  Future<void> onRefresh() async {
    BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
  }
}
