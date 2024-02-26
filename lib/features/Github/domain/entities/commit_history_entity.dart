import 'package:equatable/equatable.dart';

import 'commit_entity.dart';
import 'commit_history_author_entity.dart';
import 'parrent_commit_entity.dart';

class CommitHistoryEntity extends Equatable {
  final String? sha;
  final String? nodeId;
  final CommitEntity? commit;
  final String? url;
  final String? htmlUrl;
  final String? commentsUrl;
  final CommitHistoryAuthorEntity? author;
  final CommitHistoryAuthorEntity? committer;
  final List<ParentCommitEntity>? parents;

  const CommitHistoryEntity(
      {this.sha,
      this.nodeId,
      this.commit,
      this.url,
      this.htmlUrl,
      this.commentsUrl,
      this.author,
      this.committer,
      this.parents});

  @override
  List<Object?> get props => [
        sha,
        nodeId,
        commit,
        url,
        htmlUrl,
        commentsUrl,
        author,
        committer,
        parents,
      ];
}
