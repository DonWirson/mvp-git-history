import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Github/presentation/bloc/github_bloc.dart';

class CommitsByBranch extends StatefulWidget {
  const CommitsByBranch({required this.branchSha, super.key});

  ///Used to retrieve commit history
  final String branchSha;

  @override
  State<CommitsByBranch> createState() => _CommitsByBranchState();
}

class _CommitsByBranchState extends State<CommitsByBranch> {
  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context)
        .add(GotAllBranchCommits(branchSha: widget.branchSha));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
        );
      },
    );
  }
}
