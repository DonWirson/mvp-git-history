import 'dart:convert';

import '../../domain/entities/commit_entity.dart';
import 'commit_author.dart';
import 'tree_model.dart';
import 'verification_model.dart';

class CommitModel extends CommitEntity {
  const CommitModel({
    CommitAuthorModel? author,
    CommitAuthorModel? committer,
    String? message,
    TreeModel? tree,
    String? url,
    int? commentCount,
    VerificationModel? verification,
    String? sha,
  }) : super(
          author: author,
          committer: committer,
          message: message,
          tree: tree,
          url: url,
          commentCount: commentCount,
          verification: verification,
          sha: sha,
        );

  factory CommitModel.fromRawJson(String str) =>
      CommitModel.fromJson(json.decode(str));

  factory CommitModel.fromJson(Map<String, dynamic> json) => CommitModel(
        author: json["author"] == null
            ? null
            : CommitAuthorModel.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthorModel.fromJson(json["committer"]),
        message: json["message"],
        tree: json["tree"] == null ? null : TreeModel.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: json["verification"] == null
            ? null
            : VerificationModel.fromJson(json["verification"]),
        sha: json["sha"],
      );
}
