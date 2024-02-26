import 'dart:convert';

import '../../domain/entities/commit_history_entity.dart';
import 'commit_history_author_model.dart';
import 'commit_model.dart';
import 'parent_commit_model.dart';

class CommitHistoryModel extends CommitHistoryEntity {
  const CommitHistoryModel({
    String? sha,
    String? nodeId,
    CommitModel? commit,
    String? url,
    String? htmlUrl,
    String? commentsUrl,
    CommitHistoryAuthorModel? author,
    CommitHistoryAuthorModel? committer,
    List<ParentCommitModel>? parent,
  }) : super(
          sha: sha,
          nodeId: nodeId,
          commit: commit,
          url: url,
          htmlUrl: htmlUrl,
          commentsUrl: commentsUrl,
          author: author,
          committer: committer,
          parents: parent,
        );

  factory CommitHistoryModel.fromRawJson(String str) =>
      CommitHistoryModel.fromJson(json.decode(str));

  factory CommitHistoryModel.fromJson(Map<String, dynamic> json) =>
      CommitHistoryModel(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: json["commit"] == null
            ? null
            : CommitModel.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: json["author"] == null
            ? null
            : CommitHistoryAuthorModel.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitHistoryAuthorModel.fromJson(json["committer"]),
        parent: json["parents"] == null
            ? []
            : List<ParentCommitModel>.from(
                json["parents"]!.map((x) => ParentCommitModel.fromJson(x))),
      );
}
