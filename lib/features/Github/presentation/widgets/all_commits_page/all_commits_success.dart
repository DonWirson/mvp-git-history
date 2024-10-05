import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/components/commit_tile.dart';
import '../../../domain/entities/commit_entity.dart';
import '../../bloc/github_bloc.dart';

class AllCommitsSuccess extends StatelessWidget {
  final List<CommitEntity> commitList;

  const AllCommitsSuccess({
    required this.commitList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      BlocProvider.of<GithubBloc>(context).add(GotAllCommits());
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView.separated(
          itemCount: commitList.length,
          itemBuilder: (context, index) {
            final commit = commitList[index];
            final date = DateFormat("dd-MM-yyyy")
                .format(commit.committer!.date!)
                .toString();
            final hour =
                DateFormat("HH:mm").format(commit.committer!.date!).toString();
            return CommitTile(
              commit: commit,
              date: date,
              hour: hour,
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
          duration: const Duration(
            seconds: 1,
          ),
        );
  }
}
