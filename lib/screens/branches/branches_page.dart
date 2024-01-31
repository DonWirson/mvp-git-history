import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/github_bloc/github_bloc.dart';
import '../../core/loading_indicator.dart';
import '../../models/branch_model.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  List<BranchModel> branches = [];
  @override
  void initState() {
    BlocProvider.of<GithubBloc>(context).add(GotAllBranches());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listener: (context, state) {
        if (state is GotAllBranchesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception),
              duration: const Duration(seconds: 4),
            ),
          );
        }
        if (state is GotAllBranchesSuccessfully) {
          branches = state.branches;
        }
      },
      builder: (context, state) {
        return BlocBuilder<GithubBloc, GithubState>(
          builder: (context, state) {
            if (state is GotAllBranchesSuccessfully) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Select a branch to show commits"),
                ),
                body: ListView.separated(
                  itemCount: branches.length,
                  itemBuilder: (context, index) {
                    final branch = branches[index];
                    return ListTile(
                      title: Text("Branch: ${branch.name}"),
                      trailing: InkWell(
                        onTap: () =>
                            navigateToCommitPage(branchSha: branch.commit.sha),
                        child: const Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              );
            }
            if (state is GotAllBranchesFailure) {
              Center(
                child: ElevatedButton(
                  child: const Text("Search branches again :C"),
                  onPressed: () => BlocProvider.of<GithubBloc>(context)
                      .add(GotAllBranches()),
                ),
              );
            }

            return const LoadingIndicator();
          },
        );
      },
    );
  }
  //TODO: fix logic in CommitsByBranch screen.
  void navigateToCommitPage({required String branchSha}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("TODO feature"),
        duration: Duration(seconds: 2),
      ),
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => BlocProvider.value(
    //       value: BlocProvider.of<GithubBloc>(context),
    //       child: CommitsByBranch(
    //         branchSha: branchSha,
    //       ),
    //     ),
    //   ),
    // );
  }
}
