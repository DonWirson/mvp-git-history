import 'dart:convert';

class CommitModel {
  final String sha;
  final String url;

  CommitModel({
    required this.sha,
    required this.url,
  });

  factory CommitModel.fromJson(String str) =>
      CommitModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommitModel.fromMap(Map<String, dynamic> json) => CommitModel(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "url": url,
      };
}
