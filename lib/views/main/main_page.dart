import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/github_bloc/github_bloc.dart';
import '../../core/loading_indicator.dart';
import '../../models/branch_model.dart';
import '../commits/commit_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              duration: const Duration(seconds: 6),
            ),
          );
        }
        if (state is GotAllBranchesSuccessfull) {
          branches = state.branches;
        }
      },
      builder: (context, state) {
        return BlocBuilder<GithubBloc, GithubState>(
          builder: (context, state) {
            if (state is GotAllBranchesSuccessfull) {
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const CommitPage(
                                branchSha: "asd",
                              ),
                            ),
                          );
                        },
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
            return const LoadingIndicator();
          },
        );
      },
    );
  }
}
