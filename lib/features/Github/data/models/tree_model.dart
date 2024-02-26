import 'dart:convert';

import '../../domain/entities/tree_entity.dart';

class TreeModel extends TreeEntity {
  const TreeModel({
    String? sha,
    String? url,
  }) : super(
          sha: sha,
          url: url,
        );
  factory TreeModel.fromRawJson(String str) =>
      TreeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TreeModel.fromJson(Map<String, dynamic> json) => TreeModel(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}
