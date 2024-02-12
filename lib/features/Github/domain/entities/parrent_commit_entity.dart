import 'package:equatable/equatable.dart';

class ParentCommitEntity extends Equatable {
  final String? sha;
  final String? url;
  final String? htmlUrl;

  const ParentCommitEntity({
    this.sha,
    this.url,
    this.htmlUrl,
  });
  @override
  List<Object?> get props => [
        sha,
        url,
        htmlUrl,
      ];
}
