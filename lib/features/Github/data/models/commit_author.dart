import 'dart:convert';

import '../../domain/entities/commit_author_entity.dart';

class CommitAuthorModel extends CommitAuthorEntity {
  CommitAuthorModel({
    String? name,
    String? email,
    DateTime? date,
  }) : super(
          name: name,
          email: email,
          date: date,
        );
  factory CommitAuthorModel.fromRawJson(String str) =>
      CommitAuthorModel.fromJson(json.decode(str));

  factory CommitAuthorModel.fromJson(Map<String, dynamic> json) =>
      CommitAuthorModel(
        name: json["name"],
        email: json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );
}
