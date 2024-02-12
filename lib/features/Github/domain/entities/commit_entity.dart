import 'package:equatable/equatable.dart';

import 'commit_author_entity.dart';
import 'tree_entity.dart';
import 'verification_entity.dart';

class CommitEntity extends Equatable {
  final CommitAuthorEntity? author;
  final CommitAuthorEntity? committer;
  final String? message;
  final TreeEntity? tree;
  final String? url;
  final int? commentCount;
  final VerificationEntity? verification;
  final String? sha;

  const CommitEntity({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
    this.sha,
  });

  @override
  List<Object?> get props => [
        author,
        committer,
        message,
        tree,
        url,
        commentCount,
        verification,
      ];
}
