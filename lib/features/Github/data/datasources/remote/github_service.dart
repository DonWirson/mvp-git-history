import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/data_state/api_response.dart';
import '../../models/branch_model.dart';
import '../../models/commit_history_model.dart';

class GithubService {
  final Dio _dio;

  GithubService(this._dio);

  String apiAuth = dotenv.env['GITHUB_TOKEN']!;

  Future<ApiResponse<List<BranchModel>>> getBranchtList() async {
    final url = dotenv.env['BRANCH_ENDPOINT']!;

    Map<String, dynamic> headers = {
      "Authorization": apiAuth,
    };

    final response = await _dio.get<List<dynamic>>(
      url,
      options: Options(
        headers: headers,
      ),
    );

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

    Map<String, dynamic> headers = {
      "Authorization": apiAuth,
    };

    final response = await _dio.get<List>(
      url,
      options: Options(
        headers: headers,
      ),
    );

    final data = response.data!
        .map((branch) => CommitHistoryModel.fromJson(branch))
        .toList();

    return ApiResponse(
      data: data,
      response: response,
    );
  }
}
