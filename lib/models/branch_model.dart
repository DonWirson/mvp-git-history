import 'dart:convert';

import 'commit_model.dart';

class BranchModel {
  final String? name;
  final String? commit;
  final bool? protected;

  BranchModel({
    this.name,
    this.commit,
    this.protected,
  });

  factory BranchModel.fromJson(String str) =>
      BranchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BranchModel.fromMap(Map<String, dynamic> json) => BranchModel(
        name: json["name"],
        commit: json["commit"] == null ? null : String.fromMap(json["commit"]),
        protected: json["protected"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "commit": commit?.toMap(),
        "protected": protected,
      };
}
