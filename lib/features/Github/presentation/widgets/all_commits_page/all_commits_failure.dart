import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/github_bloc.dart';

class AllCommitsFailure extends StatelessWidget {
  const AllCommitsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Retry?"),
        onPressed: () => BlocProvider.of<GithubBloc>(context).add(
          GotAllCommits(),
        ),
      ),
    );
  }
}
