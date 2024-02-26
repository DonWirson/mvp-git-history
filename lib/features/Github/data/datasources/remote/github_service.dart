import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:git_history/core/data_state/api_response.dart';

import '../../models/branch_model.dart';
import '../../models/commit_history_model.dart';

class GithubService {
  final _dio = Dio();

  Future<ApiResponse<List<BranchModel>>> getBranchtList() async {
    final url = dotenv.env['BRANCH_ENDPOINT']!;
    final response = await _dio.get<List<dynamic>>(url);
    final data =
        response.data!.map((branch) => BranchModel.fromJson(branch)).toList();

    return ApiResponse(
      response: response,
      data: data,
    );
  }

  Future<ApiResponse<List<CommitHistoryModel>>> getCommitsByBranch(
      String branchName) async {
    final url = '${dotenv.env["COMMIT_ENDPOINT"]!}?sha=$branchName';
    final response = await _dio.get<List>(url);
    final data = response.data!
        .map((branch) => CommitHistoryModel.fromJson(branch))
        .toList();

    return ApiResponse(
      data: data,
      response: response,
    );
  }
}
