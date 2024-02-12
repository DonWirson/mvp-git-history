import 'dart:convert';

import '../../domain/entities/parrent_commit_entity.dart';

class ParentCommitModel extends ParentCommitEntity {
  const ParentCommitModel({
    String? sha,
    String? url,
    String? htmlUrl,
  }) : super(
          htmlUrl: htmlUrl,
          sha: sha,
          url: url,
        );

  factory ParentCommitModel.fromRawJson(String str) =>
      ParentCommitModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParentCommitModel.fromJson(Map<String, dynamic> json) =>
      ParentCommitModel(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };
}
