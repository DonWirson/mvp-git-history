import 'package:http/http.dart' as http;

final class GithubService {
  static const baseUrl = "https://api.github.com/";
  var client = http.Client();

  ///Checks if the Github api is running
  dynamic getApiStatus({
    required String repoOwner,
    required String repoName,
  }) {
    final url ="$baseUrl/$repoName/$repoOwner";
    
    http.get(
      Uri.parse(url),
    );
  }

  dynamic getCommitList() {}
}
