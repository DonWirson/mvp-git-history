import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/commit_entity.dart';
import '../bloc/github_bloc.dart';

class CommitList extends StatelessWidget {
  final List<CommitEntity> commitList;

  const CommitList({
    required this.commitList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
    }

    var padding = const EdgeInsets.only(top: 8);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: commitList.length,
          itemBuilder: (context, index) {
            final commit = commitList[index];
            final date = DateFormat("dd-MM-yyyy")
                .format(commit.committer!.date!)
                .toString();
            final hour =
                DateFormat("HH:mm").format(commit.committer!.date!).toString();
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListTile(
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
                      commit.author!.name!,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                title: Text(
                  commit.message!,
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
      ),
    ).animate().fadeIn(
          duration: const Duration(seconds: 1),
        );
  }
}
