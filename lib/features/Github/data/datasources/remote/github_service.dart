import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../../models/branch_model.dart';
import '../../models/commit_history_model.dart';

class GithubService {
  Future<List<BranchModel>> getBranchtList() async {
    final url = dotenv.env['BRANCH_ENDPOINT']!;
    final response = await get(Uri.parse(url));
    final Iterable decodedResponse = jsonDecode(response.body);
    return decodedResponse
        .map((branch) => BranchModel.fromJson(branch))
        .toList();
  }

  Future<List<CommitHistoryModel>> getCommitsByBranch(String branchName) async {
    final url = '${dotenv.env["COMMIT_ENDPOINT"]!}?sha=$branchName';
    final response = await get(Uri.parse(url));
    final Iterable decodedResponse = jsonDecode(response.body);
    return decodedResponse
        .map(
          (branch) => CommitHistoryModel.fromJson(branch),
        )
        .toList();
  }
}
