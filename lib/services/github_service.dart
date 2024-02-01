import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../models/branch_model.dart';
import '../models/commit_history_model.dart';

final class GithubService {
  //In case it doesnt work, add token

  ///Retrieves a list of branches in a repo
  Future<List<BranchModel>> getBranchtList() async {
    final url = dotenv.env['BRANCH_ENDPOINT']!;
    final response = await get(Uri.parse(url));
    final Iterable decodedResponse = jsonDecode(response.body);
    //TODO: Add exception handler method ---> https://docs.github.com/es/rest/commits/commits?apiVersion=2022-11-28#list-commits--status-codes
    return decodedResponse
        .map((branch) => BranchModel.fromMap(branch))
        .toList();
  }

  ///Retrieves a list of commits in a branch
  Future<List<CommitHistory>> getCommitsByBranch(String branchName) async {
    final url = '${dotenv.env["COMMIT_ENDPOINT"]!}?sha=$branchName';
    final response = await get(Uri.parse(url));
    final Iterable decodedResponse = jsonDecode(response.body);
    //TODO: Add exception handler method ---> https://docs.github.com/es/rest/commits/commits?apiVersion=2022-11-28#list-commits--status-codes
    return decodedResponse
        .map(
          (branch) => CommitHistory.fromMap(branch),
        )
        .toList();
  }
}
