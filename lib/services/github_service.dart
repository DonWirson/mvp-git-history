import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../models/branch_model.dart';

final class GithubService {
  // var client = http.Client();
  final baseUrl = dotenv.env['API_URL'];
  final repoOwner = dotenv.env['REPO_OWNER'];
  final repoName = dotenv.env['REPO_NAME'];

  ///Checks if the Github api is running
  dynamic getApiStatus() {
    final url = "$baseUrl";

    // http.get(
    //   Uri.parse(url),
    // );
  }

  Future<List<BranchModel>> getBranchtList() async {
    final url = "$baseUrl/repos/$repoOwner/$repoName/branches";

    final response = await get(Uri.parse(url));
    final Iterable decodedResponse = jsonDecode(response.body);
    return decodedResponse
        .map((branch) => BranchModel.fromMap(branch))
        .toList();
  }

  dynamic getCommitList() {}
}
